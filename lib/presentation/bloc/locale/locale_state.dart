import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_state.freezed.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.initial({required String localeCode}) = _Initial;
  const factory LocaleState.loading({required String localeCode}) = _Loading;
  const factory LocaleState.success({required String localeCode}) = _Success;
}
