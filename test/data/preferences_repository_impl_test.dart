import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';
import 'package:user_basic_info/data/repositories/preferences_repository_impl.dart';
import 'package:user_basic_info/data/models/theme_preference_model.dart';

class MockBox extends Mock implements Box<dynamic> {}

void main() {
  late MockBox box;
  late PreferencesRepositoryImpl repo;

  setUp(() {
    box = MockBox();
    repo = PreferencesRepositoryImpl(box);
  });

  test('saveTheme stores ThemePreferenceModel in box', () async {
    when(() => box.put('theme_pref', any())).thenAnswer((_) async {});

    await repo.saveTheme('dark');

    verify(() => box.put('theme_pref', predicate((v) => v is ThemePreferenceModel))).called(1);
  });

  test('getTheme returns stored mode if exists', () async {
    when(() => box.get('theme_pref')).thenReturn(ThemePreferenceModel('light'));

    final res = await repo.getTheme();

    expect(res, 'light');
  });

  test('saveLocale stores locale string in box', () async {
    when(() => box.put('locale_pref', any())).thenAnswer((_) async {});

    await repo.saveLocale('es');

    verify(() => box.put('locale_pref', 'es')).called(1);
  });

  test('getLocale returns stored locale', () async {
    when(() => box.get('locale_pref')).thenReturn('en');

    final res = await repo.getLocale();

    expect(res, 'en');
  });
}
