import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_event.freezed.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.loadRequested() = LoadLocaleRequested;
  const factory LocaleEvent.setLocaleRequested(String localeCode) = SetLocaleRequested;
}
