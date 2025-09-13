import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial({@Default(ThemeMode.system) ThemeMode mode}) = _Initial;
  const factory ThemeState.loading({required ThemeMode mode}) = _Loading;
  const factory ThemeState.success({required ThemeMode mode}) = _Success;
  const factory ThemeState.failure({required String message, required ThemeMode mode}) = _Failure;
}
