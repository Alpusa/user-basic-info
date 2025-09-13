# Copilot Instructions for user-basic-info

Guía concisa para agentes de IA en este repo Flutter.

## Big Picture

- Arquitectura Clean bajo `lib/`: `core/`, `data/`, `domain/`, `presentation/`.
- Entrada: `lib/main.dart` con `MaterialApp.router` y `go_router`.
- Persistencia local con Hive: adapters `UserModel` (typeId 0) y `AddressModel` (typeId 1); cajas `users` y `addresses` abiertas en `initDependencies()`.
- DI con `get_it` (`sl` en `injection_container.dart`): use cases (factory) y repositorios (lazySingleton).

## Layout de Código

- `domain/`: Dart puro — `entities/`, `repositories/` abstractos, `usecases/` (clases finas con `call`).
- `data/`: modelos Freezed/Hive/JSON en `data/models/*`, impl de `repositories/` mapea entidad↔modelo; datasources locales con Hive.
- `presentation/`: UI en `pages/` y `widgets/`; estado por feature en `bloc/`.
- `core/`: `router/` (GoRouter y nombres), `themes/`, `constants/`, `utils/`.

## Routing (GoRouter)

- Definido en `core/router/app_router.dart` con `StatefulShellRoute.indexedStack` (3 ramas: Usuarios, Direcciones, Configuración).
- Paths en `core/router/names_router.dart` (p.ej. `NamesRouter.createEditUser`). Navega con `context.go(NamesRouter.viewUser)`.
- `NavigationScaffold` renderiza `BottomNavigationBar` y cambia de rama con `navigationShell.goBranch(i)`.
- Páginas envueltas con `_responsiveWrapper(...)` usando `responsive_framework` para anchos consistentes.

## Estado (BLoC) y DI

- Un BLoC/Cubit por feature en `presentation/bloc/<feature>/`, inyectando casos de uso vía `sl`.
- Ejemplo: `CreateOrEditUserPage` crea `UserFormBloc(sl<SaveUser>(), sl<UpdateUser>)` y emite `UserFormEvent.*`.
- `UserObserverCubit` se provee en el shell del router para reaccionar al contexto de usuario.

### Freezed para BLoC

- Modelar eventos y estados con Freezed: archivos `..._event.dart` y `..._state.dart` + generados `*.freezed.dart` (ver `presentation/bloc/user_form/`).
- Eventos como uniones selladas (e.g. `initialized`, `nombreChanged`, `submitPressed`); estados inmutables con `copyWith`.
- Ejecutar codegen tras cambios: `dart run build_runner build --delete-conflicting-outputs`.

## Dominio y Datos

- Entidades simples (p.ej. `domain/entities/user.dart`). Use cases finos (p.ej. `SaveUser(UserRepository).call(user)`).
- Repositorios impl (`data/repositories/*`) resuelven dependencias con `GetIt`. Ej.: `UserRepositoryImpl` hace cascade delete en direcciones antes de borrar usuario.
- Modelos siempre con Freezed + Hive + JSON: anotar `@freezed`, `@HiveType(typeId: X)` y `@HiveField(n)`; exponer `fromJson/toJson` (ver `data/models/user/user_model.dart`).

## Workflows Clave

- Dependencias: `flutter pub get`.
- Codegen (Freezed/Hive/JSON): `dart run build_runner build --delete-conflicting-outputs`.
- Ejecutar: `flutter run -d windows` (Windows) o `flutter run -d chrome` (Web).
- Lint/análisis: `flutter analyze`; Formato: `dart format .`.
- Tests: `flutter test` (plantilla en `test/widget_test.dart`).

## Convenciones del Proyecto

- snake_case para archivos/carpetas; 1 tipo público por archivo.
- Texto/propiedades en español (p.ej. `nombre`, `apellido`, `fechaNacimiento`).
- No importar Flutter en `domain/*`. UI solo en `presentation/*`.
- Al añadir modelos Hive: registra adapter y abre caja en `initDependencies()`; actualiza DI/repos.

## Principios SOLID (aplicados aquí)

- Single Responsibility: cada capa/archivo con responsabilidad clara (p.ej. `UserFormBloc` orquesta estado; persistencia en repos).
- Open/Closed: contratos en `domain/repositories/*`; nuevas impl en `data/repositories/*` sin romper dominio/UI.
- Liskov Substitution: cualquier impl/mock respeta `UserRepository` (métodos y semántica).
- Interface Segregation: use cases pequeños y enfocados (`SaveUser`, `UpdateUser`, etc.).
- Dependency Inversion: dominio depende de abstracciones; `get_it` resuelve impl en `injection_container.dart`.

## Recetas Rápidas

- Nueva página: crea en `presentation/pages/mi_pagina.dart`, añade `GoRoute` en `app_router.dart` usando `_responsiveWrapper` y agrega ítem a la bottom bar si es nueva rama.
- Nuevo use case: añade en `domain/usecases`, registra en `injection_container.dart` (`sl.registerFactory(...)`), úsalo en BLoC vía `sl<MiUseCase>()`.
- Nuevo repositorio: define interfaz en `domain/repositories`, implementa en `data/repositories`, registra como `registerLazySingleton` y mapea entidad↔modelo.

# Copilot Instructions for user-basic-info

Concise guidance for AI agents working in this Flutter repo.

## Big Picture

- Clean Architecture layout under `lib/`: `core/`, `data/`, `domain/`, `presentation/`.
- Entry is `lib/main.dart` (Flutter counter template). Grow features within folders, not in `main.dart`.

## Code Layout

- `domain/`: pure Dart — `entities/`, abstract `repositories/`, `usecases/`.
- `data/`: IO/infra — DTO `models/`, `datasources/`, impl `repositories/`.
- `presentation/`: UI — `pages/`, `widgets/`, optional `bloc/` per feature.
- `core/`: cross-cutting — `router/`, `themes/`, `constants/`, `utils/`.

## Estructura Básica

```
lib/
 ├─ core/               # constants, utils, themes
 ├─ data/               # datasources (mock/local), models, repositories impl
 ├─ domain/             # entities, repositories (abstract), usecases
 ├─ presentation/
 │   ├─ bloc/           # BLoC para User y Address
 │   ├─ pages/          # Pantallas: user_form, address_form, user_summary
 │   └─ widgets/        # Widgets reutilizables (inputs, list items)
 ├─ injection_container.dart
 └─ main.dart
```

## Routing

- `go_router` is declared but unused; `core/router/` is empty.
- Create `core/router/app_router.dart` exposing a `GoRouter router` and switch `MyApp` to `MaterialApp.router`.
- Put screens in `presentation/pages/` and navigate with `context.go('/path')`.

## State & Domain

- Prefer feature-local cubits/blocs under `presentation/bloc/<feature>/` calling `domain/usecases`.
- Keep business logic in `domain/*`; avoid UI or framework deps here.

## Data Layer

- Map external data using DTOs in `data/models` with `fromJson/toJson` to `domain/entities`.
- Implement `domain/repositories` in `data/repositories`; split datasources by origin (e.g., `local/`, `remote/`).

## DI (get_it)

- Usar `get_it` en `lib/injection_container.dart` para registrar dependencias.
- Ejemplo mínimo:

  - `injection_container.dart`

    ```dart
    import 'package:get_it/get_it.dart';
    final sl = GetIt.instance;

    Future<void> initDependencies() async {
    	// Domain
    	sl.registerFactory(() => SaveUser(sl()));

    	// Data
    	sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
    	// sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());
    }
    ```

  - `main.dart`

    ```dart
    void main() async {
      # Copilot Instructions for user-basic-info

      Guía concisa para agentes de IA en este repo Flutter.

      ## Big Picture

      - Arquitectura tipo Clean bajo `lib/`: `core/`, `data/`, `domain/`, `presentation/`.
      - Entrada en `lib/main.dart`: `MyApp` usa `MaterialApp.router` con `go_router` y temas en `core/themes/`.
      - Persistencia local con Hive: adapters `UserModel` (typeId 0) y `AddressModel` (typeId 1); cajas `users` y `addresses` abiertas en `initDependencies()`.
      - DI con `get_it` (`sl` en `injection_container.dart`): registra use cases (factory) y repositorios (lazySingleton).

      ## Layout de Código

      - `domain/`: Dart puro — `entities/`, `repositories/` abstractos, `usecases/` (clases finas con `call`).
      - `data/`: modelos Freezed/Hive/JSON en `data/models/*`, impl de `repositories/` convierte manualmente entre modelo y entidad.
      - `presentation/`: UI en `pages/` y `widgets/`, estado por feature en `bloc/`.
      - `core/`: `router/` (GoRouter + nombres), `themes/`, `constants/`, `utils/`.

      ## Routing (GoRouter)

      - Router en `core/router/app_router.dart` usando `StatefulShellRoute.indexedStack` con 3 ramas: Usuarios, Direcciones, Configuración.
      - Constantes de paths en `core/router/names_router.dart` (p.ej. `NamesRouter.createEditUser`). Navega con `context.go(NamesRouter.viewUser)`.
      - `NavigationScaffold` controla un `BottomNavigationBar` y cambia de rama con `navigationShell.goBranch(i)`.
      - Envuelve páginas con `_responsiveWrapper(...)` (usa `responsive_framework`) para anchos consistentes.

      ## Estado (BLoC) y DI

      - BLoC/Cubit por feature bajo `presentation/bloc/<feature>/`, inyectando casos de uso vía `sl`.
      - Ejemplo: `CreateOrEditUserPage` crea `UserFormBloc(sl<SaveUser>(), sl<UpdateUser> )` y envía eventos `UserFormEvent.*`.
      - `UserObserverCubit` se provee en el shell del router para observar cambios de usuario al navegar.

      ### Freezed para BLoC

      - Usar Freezed para modelar eventos y estados de BLoC: archivos `..._event.dart` y `..._state.dart` con sus generados `*.freezed.dart` (ver `presentation/bloc/user_form/`).
      - Eventos como uniones selladas (e.g. `initialized`, `nombreChanged`, `submitPressed`); estados inmutables con `copyWith`.
      - Ejecutar codegen tras cambios: `dart run build_runner build --delete-conflicting-outputs`.

      ## Dominio y Datos

      - Entidades simples (p.ej. `domain/entities/user.dart`). Use cases finos (p.ej. `SaveUser(UserRepository).call(user)`).
      - Repositorios impl (`data/repositories/*`) resuelven dependencias con `GetIt`. Ej.: `UserRepositoryImpl` hace cascade delete de direcciones antes de borrar un usuario.
      - Modelos siempre con Freezed + Hive + JSON: anotar `@freezed`, `@HiveType(typeId: X)` y campos `@HiveField(n)`; exponer `fromJson/toJson` (ver `data/models/user/user_model.dart`).

      ## Workflows Clave

      - Dependencias: `flutter pub get`.
      - Codegen (requerido por Freezed/Hive/JSON): `dart run build_runner build --delete-conflicting-outputs`.
      - Ejecutar: `flutter run -d windows` (Windows) o `flutter run -d chrome` (Web).
      - Lint/analizar/formatear: `flutter analyze`; `dart format .`.
      - Tests: `flutter test` (plantilla en `test/widget_test.dart`).

      ## Convenciones del Proyecto

      - snake_case para archivos/carpetas; 1 tipo público por archivo.
      - Texto/propiedades en español (p.ej. `nombre`, `apellido`, `fechaNacimiento`).
      - No importar Flutter en `domain/*`. UI solo en `presentation/*`.
      - Al añadir modelos Hive: registra adapter y abre caja en `initDependencies()`; actualiza DI y repos.

      ## Principios SOLID (aplicados aquí)

      - Single Responsibility: cada capa y archivo con una responsabilidad clara (p.ej. `UserFormBloc` solo orquesta estado; validación y formato simples; persistencia vive en repos).
      - Open/Closed: `domain/repositories/*` definen contratos; agrega nuevas implementaciones en `data/repositories/*` o nuevos datasources sin cambiar dominio/UI.
      - Liskov Substitution: cualquier `UserRepositoryImpl`/mock debe respetar `UserRepository` (ej. métodos `saveUser/getUserById/...` conservan semántica).
      - Interface Segregation: use cases pequeños y enfocados (`SaveUser`, `UpdateUser`, etc.); no expongas interfaces “gordas”. Divide por feature (User/Address).
      - Dependency Inversion: dominio depende de abstracciones; `data/*` implementa; `get_it` (`sl`) resuelve dependencias en `injection_container.dart`.

      ## Recetas Rápidas

      - Nueva página: crea en `presentation/pages/mi_pagina.dart`, añade `GoRoute` en `app_router.dart` usando `_responsiveWrapper`, y un item de bottom bar si es una nueva rama.
      - Nuevo use case: añade en `domain/usecases`, registra en `injection_container.dart` con `sl.registerFactory(...)`, y consúmelo en el BLoC vía `sl<MiUseCase>()`.
      - Nuevo repositorio: define interfaz en `domain/repositories`, impl en `data/repositories`, registra como `registerLazySingleton` y realiza el mapeo entidad↔modelo.
    ```
