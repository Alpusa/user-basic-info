import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:user_basic_info/presentation/pages/addresses_page.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_bloc.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_state.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_event.dart';
import 'package:user_basic_info/domain/entities/address.dart' as d;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

class MockAddressesListBloc
    extends MockBloc<AddressesListEvent, AddressesListState>
    implements AddressesListBloc {}

void main() {
  Widget appWith(AddressesListBloc bloc) => MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('es')],
        home: BlocProvider.value(value: bloc, child: const AddressesPage()),
      );

  testWidgets('AddressesPage muestra loading', (tester) async {
    final bloc = MockAddressesListBloc();
    whenListen(
      bloc,
      Stream.fromIterable([
        const AddressesListState.loading(),
      ]),
      initialState: const AddressesListState.initial(),
    );
    await tester.pumpWidget(appWith(bloc));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('AddressesPage muestra lista en success', (tester) async {
    final bloc = MockAddressesListBloc();
    final addresses = [
      const d.Address(
        id: 'a1',
        userId: 'u1',
        pais: 'CO',
        departamento: 'ANT',
        municipio: 'Medellín',
        direccion: 'Calle 1 #2-3',
      ),
    ];
    whenListen(
      bloc,
      Stream.fromIterable([
        AddressesListState.success(addresses),
      ]),
      initialState: const AddressesListState.initial(),
    );
    await tester.pumpWidget(appWith(bloc));
    await tester.pump();
    expect(find.textContaining('Calle 1'), findsOneWidget);
  });
}
