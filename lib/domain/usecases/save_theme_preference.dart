import '../repositories/preferences_repository.dart';

class SaveThemePreference {
  final PreferencesRepository repository;

  SaveThemePreference(this.repository);

  Future<void> call(String mode) async {
    await repository.saveTheme(mode);
  }
}
