import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_basic_info/presentation/bloc/locale/locale_bloc.dart';
import 'package:user_basic_info/domain/usecases/get_locale_preference.dart';
import 'package:user_basic_info/domain/usecases/save_locale_preference.dart';
import 'package:user_basic_info/presentation/bloc/locale/locale_event.dart';
import 'package:user_basic_info/presentation/bloc/locale/locale_state.dart';

class MockGetLocale extends Mock implements GetLocalePreference {}
class MockSaveLocale extends Mock implements SaveLocalePreference {}

void main() {
  late MockGetLocale mockGet;
  late MockSaveLocale mockSave;
  setUp(() {
    mockGet = MockGetLocale();
    mockSave = MockSaveLocale();
  });

  group('LocaleBloc', () {
    blocTest<LocaleBloc, LocaleState>(
      'loads locale and emits success',
      build: () {
        when(() => mockGet.call()).thenAnswer((_) async => 'es');
        return LocaleBloc(getLocale: mockGet, saveLocale: mockSave, initial: null);
      },
      act: (bloc) => bloc.add(LoadLocaleRequested()),
      expect: () => [isA<LocaleState>()],
    );

    blocTest<LocaleBloc, LocaleState>(
      'sets locale and emits success',
      build: () {
        when(() => mockSave.call(any())).thenAnswer((_) async {});
        return LocaleBloc(getLocale: mockGet, saveLocale: mockSave, initial: null);
      },
      act: (bloc) => bloc.add(const SetLocaleRequested('en')),
      expect: () => [isA<LocaleState>()],
    );
  });
}
