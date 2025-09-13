import '../repositories/preferences_repository.dart';

class GetLocalePreference {
  final PreferencesRepository repository;

  GetLocalePreference(this.repository);

  Future<String?> call() async {
    return repository.getLocale();
  }
}
