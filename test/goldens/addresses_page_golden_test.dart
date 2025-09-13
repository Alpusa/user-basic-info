import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:user_basic_info/presentation/pages/addresses_page.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_bloc.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_state.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_event.dart';
import 'package:user_basic_info/domain/entities/address.dart' as d;
import 'package:user_basic_info/l10n/app_localizations.dart';

class MockAddressesListBloc
    extends MockBloc<AddressesListEvent, AddressesListState>
    implements AddressesListBloc {}

Widget _appWith(AddressesListBloc bloc, {Locale? locale}) => MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      locale: locale,
      home: BlocProvider.value(value: bloc, child: const AddressesPage()),
    );

void main() {
  setUp(() async {
    await loadAppFonts();
  });

  testGoldens('AddressesPage golden - loading/success (en)', (tester) async {
    final bloc = MockAddressesListBloc();
    whenListen(
      bloc,
      Stream.fromIterable([
        const AddressesListState.loading(),
        AddressesListState.success([
          const d.Address(
            id: 'a1',
            userId: 'u1',
            pais: 'CO',
            departamento: 'ANT',
            municipio: 'Medellín',
            direccion: 'Calle 1 #2-3',
          )
        ]),
      ]),
      initialState: const AddressesListState.initial(),
    );

    final widget = _appWith(bloc, locale: const Locale('en'));
    await tester.pumpWidgetBuilder(widget);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'addresses_page_en');
  });

  testGoldens('AddressesPage golden - success multi (es)', (tester) async {
    final bloc = MockAddressesListBloc();
    whenListen(
      bloc,
      Stream.fromIterable([
        AddressesListState.success([
          const d.Address(
            id: 'a1',
            userId: 'u1',
            pais: 'CO',
            departamento: 'ANT',
            municipio: 'Medellín',
            direccion: 'Calle 1 #2-3',
          )
        ]),
      ]),
      initialState: const AddressesListState.initial(),
    );

    final widget = _appWith(bloc, locale: const Locale('es'));
    await tester.pumpWidgetBuilder(widget);
    await tester.pumpAndSettle();
    await multiScreenGolden(
      tester,
      'addresses_page_es_multi',
      devices: [Device.phone, Device.tabletLandscape],
    );
  });
}
