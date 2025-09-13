# user_basic_info — Prueba técnica Flutter

Adjunto/comparto mi solución a la prueba técnica asignada. He desarrollado el proyecto en Flutter, siguiendo buenas prácticas (Clean Architecture, BLoC, DI con get_it) y lo he documentado para facilitar instalación, ejecución y evaluación.

## Releases

- Último release: [v1.0.0+1](https://github.com/Alpusa/user-basic-info/releases/tag/v1.0.0%2B1)
- Todos los releases: [Releases](https://github.com/Alpusa/user-basic-info/releases)

## Resumen

- Gestión de usuarios y direcciones con persistencia local (Hive).
- Navegación con `go_router` y UI responsive (`responsive_framework`).
- Estado por feature con `flutter_bloc` y casos de uso en dominio.
- Modelos con `freezed` + `json_serializable` + Hive Adapters.
- Internacionalización con `flutter_localizations`/`intl`.
- Tests unitarios, de widgets y golden tests.

## Requisitos

- Flutter 3.24+ (Dart 3.9+). Verificar con:

```powershell
flutter --version
```

## Instalación

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

Notas:

- El codegen es necesario para `freezed`, `json_serializable` y los adapters de Hive.
- Los assets se gestionan desde `pubspec.yaml` (p.ej. `assets/worldcities.json`).

## Ejecución

- Windows (recomendado):

```powershell
flutter run -d windows
```

- Web (alternativa):

```powershell
flutter run -d chrome
```

## Tests

Ejecutar toda la suite (unit/widget/goldens):

```powershell
flutter test
```

Actualizar imágenes golden cuando cambie el diseño:

```powershell
flutter test --update-goldens
# o con variable de entorno
$env:UPDATE_GOLDENS="true"; flutter test
```

## Análisis y formato

```powershell
flutter analyze
dart format .
```

## Build de producción

- Windows:

```powershell
flutter build windows --release
```

- Web:

```powershell
flutter build web --release
```

## Arquitectura

- Capas en `lib/`:
  - `core/`: router, temas, utilidades y constantes.
  - `domain/`: entidades, repositorios abstractos y casos de uso (sin dependencias de Flutter).
  - `data/`: modelos (Freezed/JSON/Hive), datasources locales (Hive) e implementación de repositorios.
  - `presentation/`: UI (páginas y widgets) y estado por feature con BLoC/Cubit.
- DI con `get_it` en `lib/injection_container.dart`.
- Router con `go_router` (ver `core/router/`) y navegación por nombres.
- Persistencia con Hive; cajas para usuarios y direcciones; adapters registrados en la inicialización.

## Estructura de carpetas (extracto)

```text
lib/
 ├─ core/
 ├─ data/
 ├─ domain/
 ├─ presentation/
 ├─ injection_container.dart
 └─ main.dart
assets/
  └─ worldcities.json
test/
 ├─ bloc/ data/ domain/ presentation/ router/
 └─ goldens/
```

## Decisiones técnicas clave

- BLoC por feature y casos de uso finos para mantener el dominio independiente.
- Modelado inmutable y serialización automática con Freezed/JSON.
- Hive para almacenamiento local sin complicaciones y rápido en escritorio/web compatible (cuando aplica).
- `responsive_framework` para breakpoints coherentes en pantallas grandes.
- Golden tests para asegurar estabilidad visual de UI.

## Troubleshooting

- Errores de codegen: ejecutar de nuevo `dart run build_runner build --delete-conflicting-outputs`.
- Golden tests distintos entre máquinas: usar `--update-goldens` y validar fuentes/escala.
- Problemas con Hive en escritorio: cerrar la app entre builds y limpiar `build/` si persisten conflictos.

---
