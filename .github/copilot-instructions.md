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
    	WidgetsFlutterBinding.ensureInitialized();
    	await initDependencies();
    	runApp(const MyApp());
    }
    ```
  - Uso en UI/BLoC
    ```dart
    BlocProvider(
    	create: (_) => UserFormCubit(sl<SaveUser>()),
    	child: const UserFormPage(),
    )
    ```

## Theming

- Centralize `ThemeData` under `core/themes/`. Replace inline theme in `main.dart` with exported theme builders when theming arrives.

## Workflows

- Install deps: `flutter pub get`.
- Run: `flutter run -d windows` (Windows), `flutter run -d chrome` (Web), emulators for Android/iOS.
- Tests live in `test/` (e.g., `test/widget_test.dart`): `flutter test`.
- Lint/analyze: `flutter analyze`. Format: `dart format .`.

## Conventions

- Follow `flutter_lints` (`analysis_options.yaml`). Snake_case files/dirs. One public type per file.
- Widgets only in `presentation/*`. `domain/*` is pure Dart, testable and platform-agnostic.

## Quick Start Example

- Page: `presentation/pages/user_form_page.dart`.
- Router: add route `/user-form` in `core/router/app_router.dart`; use `context.go('/user-form')`.
- State: `presentation/bloc/user_form/` cubit uses a `SaveUser` use case.
