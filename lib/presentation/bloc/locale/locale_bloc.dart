import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final Box preferencesBox;

  LocaleBloc({required this.preferencesBox, String? initial}) : super(LocaleState.initial(localeCode: initial ?? 'system')) {
    on<LoadLocaleRequested>(_onLoad);
    on<SetLocaleRequested>(_onSetLocaleRequested);
  }

  Future<void> _onLoad(LoadLocaleRequested event, Emitter<LocaleState> emit) async {
    final stored = preferencesBox.get('locale_pref') as String?;
    emit(LocaleState.success(localeCode: stored ?? 'system'));
  }

  Future<void> _onSetLocaleRequested(SetLocaleRequested event, Emitter<LocaleState> emit) async {
    await preferencesBox.put('locale_pref', event.localeCode);
    emit(LocaleState.success(localeCode: event.localeCode));
  }
}
