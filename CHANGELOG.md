# Changelog

Todas las notas de cambios de user_basic_info.

## [1.0.0+1] - 2025-09-13

### Añadido

- Release inicial para:
  - Windows (x64): ejecutable portable (`user_basic_info-1.0.0+1-windows-x64.zip`).
  - Web: paquete estático (`user_basic_info-1.0.0+1-web.zip`).
  - Android: APK (`user_basic_info-1.0.0+1-android.apk`).
- Checksums SHA256 en `dist/SHA256SUMS.txt`.
- Notas de release por plataforma en `dist/`.

### Técnicos

- Arquitectura Clean con BLoC, DI (`get_it`), navegación `go_router`, persistencia Hive.
- Codegen con Freezed/JSON y golden tests para UI.
