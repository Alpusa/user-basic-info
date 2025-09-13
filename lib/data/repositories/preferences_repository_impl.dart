import 'package:hive/hive.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../models/theme_preference_model.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final Box _box;

  PreferencesRepositoryImpl(this._box);

  @override
  Future<String?> getLocale() async {
    final v = _box.get('locale_pref') as String?;
    return v;
  }

  @override
  Future<String?> getTheme() async {
    final stored = _box.get('theme_pref') as ThemePreferenceModel?;
    return stored?.mode;
  }

  @override
  Future<void> saveLocale(String code) async {
    await _box.put('locale_pref', code);
  }

  @override
  Future<void> saveTheme(String mode) async {
    await _box.put('theme_pref', ThemePreferenceModel(mode));
  }
}
