This app uses world_csc_picker which expects `assets/worldcities.json`.
Fetch the JSON at build time via pub get, but since package assets are not auto-copied, we vendor the file.

Source: https://raw.githubusercontent.com/Arpit980jai/world_csc_picker/main/assets/worldcities.json

If you need to refresh:
1) Download the file above and replace `assets/worldcities.json`.
2) Run:
   flutter pub get
