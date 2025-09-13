import '../repositories/preferences_repository.dart';

class GetThemePreference {
  final PreferencesRepository repository;

  GetThemePreference(this.repository);

  Future<String?> call() async {
    return repository.getTheme();
  }
}
