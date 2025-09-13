# user_basic_info 1.0.0+1 — Web

## Resumen

- Build de release para Web (SPA lista para hosting estático).

## Cómo desplegar

- Hosting estático (GitHub Pages, Netlify, Vercel, S3, Nginx):
  1. Descomprime `user_basic_info-1.0.0+1-web.zip`.
  2. Sube el contenido de la carpeta a tu hosting.
  3. Asegura que `index.html` sea servido para rutas internas (single-page app).

## Verificación de integridad

- Comprueba el hash con el contenido de `SHA256SUMS.txt` (en `dist/`).

## Notas

- Se incluye `flutter_service_worker.js` para caching básico. Invalida caché tras publicar una nueva versión.
