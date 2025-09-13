import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:user_basic_info/presentation/pages/users_page.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_bloc.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_state.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_event.dart';
import 'package:user_basic_info/domain/entities/user.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

class MockUsersListBloc extends MockBloc<UsersListEvent, UsersListState>
    implements UsersListBloc {}

Widget _appWith(UsersListBloc bloc, {Locale? locale}) => MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      locale: locale,
      home: BlocProvider.value(value: bloc, child: const UsersPage()),
    );

void main() {
  setUp(() async {
    await loadAppFonts();
  });

  testGoldens('UsersPage golden - loading and success (en)', (tester) async {
    final bloc = MockUsersListBloc();
    whenListen(
      bloc,
      Stream.fromIterable([
        const UsersListState.loading(),
        UsersListState.success([
          User(id: '1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1)),
        ]),
      ]),
      initialState: const UsersListState.initial(),
    );

    final widget = _appWith(bloc, locale: const Locale('en'));
    await tester.pumpWidgetBuilder(widget);
    await tester.pump();
    await tester.pump();

    await screenMatchesGolden(tester, 'users_page_en');
  });

  testGoldens('UsersPage golden - success (es)', (tester) async {
    final bloc = MockUsersListBloc();
    whenListen(
      bloc,
      Stream.fromIterable([
        UsersListState.success([
          User(id: '1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1)),
        ]),
      ]),
      initialState: const UsersListState.initial(),
    );

    final widget = _appWith(bloc, locale: const Locale('es'));
    await tester.pumpWidgetBuilder(widget);
    await tester.pumpAndSettle();

    await multiScreenGolden(
      tester,
      'users_page_es_multi',
      devices: const [Device.phone, Device.tabletLandscape],
    );
  });
}
