import '../repositories/preferences_repository.dart';

class SaveLocalePreference {
  final PreferencesRepository repository;

  SaveLocalePreference(this.repository);

  Future<void> call(String code) async {
    await repository.saveLocale(code);
  }
}
