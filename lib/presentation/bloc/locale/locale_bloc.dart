import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_basic_info/domain/usecases/get_locale_preference.dart';
import 'package:user_basic_info/domain/usecases/save_locale_preference.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final GetLocalePreference getLocale;
  final SaveLocalePreference saveLocale;

  LocaleBloc({required this.getLocale, required this.saveLocale, String? initial}) : super(LocaleState.initial(localeCode: initial ?? 'system')) {
    on<LoadLocaleRequested>(_onLoad);
    on<SetLocaleRequested>(_onSetLocaleRequested);
  }

  Future<void> _onLoad(LoadLocaleRequested event, Emitter<LocaleState> emit) async {
    final stored = await getLocale();
    emit(LocaleState.success(localeCode: stored ?? 'system'));
  }

  Future<void> _onSetLocaleRequested(SetLocaleRequested event, Emitter<LocaleState> emit) async {
    await saveLocale(event.localeCode);
    emit(LocaleState.success(localeCode: event.localeCode));
  }
}
