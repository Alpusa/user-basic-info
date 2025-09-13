import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:user_basic_info/presentation/bloc/theme/theme_bloc.dart';
import 'package:user_basic_info/domain/usecases/get_theme_preference.dart';
import 'package:user_basic_info/domain/usecases/save_theme_preference.dart';
import 'package:user_basic_info/presentation/bloc/theme/theme_event.dart';
import 'package:user_basic_info/presentation/bloc/theme/theme_state.dart';

class MockGetTheme extends Mock implements GetThemePreference {}
class MockSaveTheme extends Mock implements SaveThemePreference {}

void main() {
  late MockGetTheme mockGet;
  late MockSaveTheme mockSave;
  setUp(() {
    mockGet = MockGetTheme();
    mockSave = MockSaveTheme();
  });

  group('ThemeBloc', () {
    blocTest<ThemeBloc, ThemeState>(
      'toggles theme and emits loading->success',
      build: () {
        when(() => mockSave.call(any())).thenAnswer((_) async {});
        return ThemeBloc(getTheme: mockGet, saveTheme: mockSave, initial: ThemeMode.light);
      },
      act: (bloc) => bloc.add(const ThemeEvent.toggleRequested()),
      expect: () => [isA<ThemeState>(), isA<ThemeState>()],
    );

    blocTest<ThemeBloc, ThemeState>(
      'setThemeRequested emits success when mode changes',
      build: () {
        when(() => mockSave.call(any())).thenAnswer((_) async {});
        return ThemeBloc(getTheme: mockGet, saveTheme: mockSave, initial: ThemeMode.system);
      },
      act: (bloc) => bloc.add(const ThemeEvent.setThemeRequested('dark')),
      expect: () => [isA<ThemeState>(), isA<ThemeState>()],
    );
  });
}
