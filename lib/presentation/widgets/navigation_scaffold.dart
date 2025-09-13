import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavigationScaffold({super.key, required this.navigationShell});

  void _goBranch(int index, BuildContext context) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (i) => _goBranch(i, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Usuarios'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Direcciones'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configuración'),
        ],
      ),
    );
  }
}
