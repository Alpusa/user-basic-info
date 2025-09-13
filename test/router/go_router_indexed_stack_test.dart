import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('BottomNavigation cambia entre ramas en StatefulShellRoute', (tester) async {
    final router = GoRouter(
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (i) => navigationShell.goBranch(i),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users'),
                BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Addresses'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          ),
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

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('users_view')), findsOneWidget);

    await tester.tap(find.text('Addresses'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('addresses_view')), findsOneWidget);

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settings_view')), findsOneWidget);
  });
}
