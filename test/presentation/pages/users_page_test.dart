import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:user_basic_info/presentation/pages/users_page.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_bloc.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_state.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_event.dart';
import 'package:user_basic_info/domain/entities/user.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

class MockUsersListBloc extends MockBloc<UsersListEvent, UsersListState>
    implements UsersListBloc {}

void main() {
  Widget appWith(UsersListBloc bloc) => MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('es')],
        home: BlocProvider.value(value: bloc, child: const UsersPage()),
      );

  testWidgets('UsersPage muestra loading', (tester) async {
    final bloc = MockUsersListBloc();
    whenListen(
      bloc,
      Stream.fromIterable([
        const UsersListState.loading(),
      ]),
      initialState: const UsersListState.initial(),
    );
    await tester.pumpWidget(appWith(bloc));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('UsersPage muestra lista en success', (tester) async {
    final bloc = MockUsersListBloc();
    final users = [
      User(id: '1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1)),
    ];
    whenListen(
      bloc,
      Stream.fromIterable([
        UsersListState.success(users),
      ]),
      initialState: const UsersListState.initial(),
    );
    await tester.pumpWidget(appWith(bloc));
    await tester.pump();
    expect(find.text('Ana Lopez'), findsOneWidget);
  });
}
