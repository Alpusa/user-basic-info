import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadRequested() = LoadRequested;
  const factory SettingsEvent.deleteAllUsersRequested() = DeleteAllUsersRequested;
  const factory SettingsEvent.deleteAllAddressesRequested() = DeleteAllAddressesRequested;
}
