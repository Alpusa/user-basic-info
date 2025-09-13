import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({
    @Default(false) bool isLoading,
    @Default(0) int usersCount,
    @Default(0) int addressesCount,
  }) = _Initial;

  const factory SettingsState.loading({
    @Default(0) int usersCount,
    @Default(0) int addressesCount,
  }) = _Loading;

  const factory SettingsState.success({
    required int usersCount,
    required int addressesCount,
  }) = _Success;

  const factory SettingsState.failure({
    required String message,
    @Default(0) int usersCount,
    @Default(0) int addressesCount,
  }) = _Failure;
}
