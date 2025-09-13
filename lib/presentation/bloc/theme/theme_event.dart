import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_event.freezed.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toggleRequested() = _ToggleRequested;
  const factory ThemeEvent.setThemeRequested(String mode) = _SetThemeRequested; // mode: 'light'|'dark'|'system'
}
