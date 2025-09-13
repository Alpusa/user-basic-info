import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
// Freezed-generated event/state provide the necessary types.

import 'theme_event.dart';
import 'theme_state.dart';
import 'package:hive/hive.dart';
import '../../../data/models/theme_preference_model.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final Box preferencesBox;

  ThemeBloc({required this.preferencesBox, ThemeMode? initial})
    : super(ThemeState.initial(mode: initial ?? ThemeMode.system)) {
    on<ThemeEvent>(_onEvent);
  }

  Future<void> _onEvent(ThemeEvent event, Emitter<ThemeState> emit) async {
    await event.map(
      toggleRequested: (e) async {
        final current = state.when(
          initial: (m) => m,
          loading: (m) => m,
          success: (m) => m,
          failure: (_, m) => m,
        );
        final next = current == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
        emit(ThemeState.loading(mode: current));
        await preferencesBox.put(
          'theme_pref',
          ThemePreferenceModel(
            next == ThemeMode.dark
                ? 'dark'
                : (next == ThemeMode.light ? 'light' : 'system'),
          ),
        );
        emit(ThemeState.success(mode: next));
      },
      setThemeRequested: (e) async {
        final mode = _parseMode(e.mode);
        final current = state.when(
          initial: (m) => m,
          loading: (m) => m,
          success: (m) => m,
          failure: (_, m) => m,
        );
        if (mode == current) return;
        emit(ThemeState.loading(mode: current));
        await preferencesBox.put(
          'theme_pref',
          ThemePreferenceModel(
            mode == ThemeMode.dark
                ? 'dark'
                : (mode == ThemeMode.light ? 'light' : 'system'),
          ),
        );
        emit(ThemeState.success(mode: mode));
      },
    );
  }

  ThemeMode _parseMode(String s) {
    switch (s) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
