import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings/settings_bloc.dart';
import '../bloc/settings/settings_state.dart';
import '../bloc/settings/settings_event.dart';
import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_event.dart';
import '../bloc/theme/theme_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      final theme = Theme.of(context);
  final onSurfaceSubtle = theme.colorScheme.onSurface.withOpacity(0.7);

      final isLoading = state.maybeWhen(loading: (usersCount, addressesCount) => true, orElse: () => false);
      final usersCount = state.maybeWhen(
        success: (u, a) => u,
        initial: (isLoading, u, a) => u,
        loading: (u, a) => u,
        failure: (m, u, a) => u,
        orElse: () => 0,
      );
      final addressesCount = state.maybeWhen(
        success: (u, a) => a,
        initial: (isLoading, u, a) => a,
        loading: (u, a) => a,
        failure: (m, u, a) => a,
        orElse: () => 0,
      );

      return Scaffold(
        appBar: AppBar(title: const Text('Configuración'), centerTitle: true),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Text('Configuración', textAlign: TextAlign.center, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 24),
                Card(
                  child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
                    final mode = state.when(
                      initial: (m) => m,
                      loading: (m) => m,
                      success: (m) => m,
                      failure: (_, m) => m,
                    );
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: SegmentedButton<ThemeMode>(
                        segments: const [
                          ButtonSegment(value: ThemeMode.system, label: Text('Sistema')),
                          ButtonSegment(value: ThemeMode.light, label: Text('Claro')),
                          ButtonSegment(value: ThemeMode.dark, label: Text('Oscuro')),
                        ],
                        selected: <ThemeMode>{mode},
                        onSelectionChanged: (newSelection) {
                          final sel = newSelection.first;
                          if (sel == ThemeMode.system) {
                            context.read<ThemeBloc>().add(const ThemeEvent.setThemeRequested('system'));
                          } else if (sel == ThemeMode.light) {
                            context.read<ThemeBloc>().add(const ThemeEvent.setThemeRequested('light'));
                          } else {
                            context.read<ThemeBloc>().add(const ThemeEvent.setThemeRequested('dark'));
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 12),
                Card(
                  child: ListTile(
                    title: const Text('Total usuarios'),
                    trailing: isLoading
                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
                        : Text('$usersCount', style: theme.textTheme.titleMedium?.copyWith(color: onSurfaceSubtle)),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    title: const Text('Total direcciones'),
                    trailing: isLoading
                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
                        : Text('$addressesCount', style: theme.textTheme.titleMedium?.copyWith(color: onSurfaceSubtle)),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.tonal(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (c) => AlertDialog(
                              title: const Text('Confirmar'),
                              content: const Text('¿Eliminar todas las direcciones? Esta acción no se puede deshacer.'),
                              actions: [
                                TextButton(onPressed: () => Navigator.of(c).pop(false), child: const Text('Cancelar')),
                                TextButton(onPressed: () => Navigator.of(c).pop(true), child: const Text('Eliminar')),
                              ],
                            ),
                          );
                          if (confirmed == true) {
                            if (!context.mounted) return;
                            context.read<SettingsBloc>().add(const SettingsEvent.deleteAllAddressesRequested());
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Eliminando direcciones...')));
                          }
                        },
                  style: FilledButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text('Eliminar todas las direcciones'),
                ),
                const SizedBox(height: 12),
                FilledButton.tonal(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (c) => AlertDialog(
                              title: const Text('Confirmar'),
                              content: const Text('¿Eliminar todos los usuarios? Esta acción no se puede deshacer.'),
                              actions: [
                                TextButton(onPressed: () => Navigator.of(c).pop(false), child: const Text('Cancelar')),
                                TextButton(onPressed: () => Navigator.of(c).pop(true), child: const Text('Eliminar')),
                              ],
                            ),
                          );
                          if (confirmed == true) {
                            if (!context.mounted) return;
                            context.read<SettingsBloc>().add(const SettingsEvent.deleteAllUsersRequested());
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Eliminando usuarios...')));
                          }
                        },
                  style: FilledButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text('Eliminar todos los usuarios'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
