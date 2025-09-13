# user_basic_info 1.0.0+1 — Windows (x64)

## Resumen

- Build de release para Windows (x64).
- Arquitectura Clean, BLoC, DI con get_it, routing con go_router.
- Persistencia local con Hive y modelos con Freezed/JSON.

## Requisitos

- Windows 10/11 x64.
- No requiere instalación: descomprimir y ejecutar `user_basic_info.exe`.

## Cómo usar

1. Descomprime `user_basic_info-1.0.0+1-windows-x64.zip`.
2. Abre la carpeta y ejecuta `user_basic_info.exe`.

## Verificación de integridad

- Archivo de checksums: `SHA256SUMS.txt`.
- Para verificar en PowerShell:

```powershell
Get-FileHash -Path .\user_basic_info-1.0.0+1-windows-x64.zip -Algorithm SHA256
```

## Notas

- Si Windows SmartScreen avisa, selecciona “Más información” → “Ejecutar de todas formas”.
- Si ya existe una carpeta de datos previa, cierre la app antes de reemplazar archivos.

## Cambios relevantes

- Primera entrega pública del ejecutable de escritorio.
