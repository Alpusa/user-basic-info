import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:user_basic_info/presentation/widgets/navigation_scaffold.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

void main() {
  testWidgets('NavigationScaffold muestra labels localizados y navega entre ramas', (tester) async {
    final router = GoRouter(
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => NavigationScaffold(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(path: '/', builder: (c, s) => const Center(key: Key('users_view'), child: Text('Users'))),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(path: '/addresses', builder: (c, s) => const Center(key: Key('addresses_view'), child: Text('Addresses'))),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(path: '/settings', builder: (c, s) => const Center(key: Key('settings_view'), child: Text('Settings'))),
            ]),
          ],
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('es')],
        locale: const Locale('en'),
      ),
    );

    await tester.pumpAndSettle();

    // Verifica labels en inglés desde ARB (Users, Addresses, Settings)
    expect(find.text('Users'), findsWidgets);
    expect(find.text('Addresses'), findsWidgets);
    expect(find.text('Settings'), findsWidgets);

    // Vista inicial
    expect(find.byKey(const Key('users_view')), findsOneWidget);

    // Cambia a Addresses
    await tester.tap(find.text('Addresses').first);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('addresses_view')), findsOneWidget);

    // Cambia a Settings
    await tester.tap(find.text('Settings').first);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settings_view')), findsOneWidget);
  });
}
