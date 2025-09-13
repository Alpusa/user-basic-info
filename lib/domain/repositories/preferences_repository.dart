abstract class PreferencesRepository {
  Future<void> saveTheme(String mode);
  Future<String?> getTheme();

  Future<void> saveLocale(String code);
  Future<String?> getLocale();
}
