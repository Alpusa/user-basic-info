import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';
import '../bloc/locale/locale_bloc.dart';
import '../bloc/locale/locale_event.dart';

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
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final onSurfaceSubtle = theme.colorScheme.onSurface.withOpacity(0.7);

        final isLoading = state.maybeWhen(
          loading: (usersCount, addressesCount) => true,
          orElse: () => false,
        );
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

        final t = AppLocalizations.of(context)!;
        return Scaffold(
          appBar: AppBar(title: Text(t.settings), centerTitle: true),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    t.settings,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        final mode = state.when(
                          initial: (m) => m,
                          loading: (m) => m,
                          success: (m) => m,
                          failure: (_, m) => m,
                        );
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: SegmentedButton<ThemeMode>(
                            segments: [
                              ButtonSegment(
                                value: ThemeMode.system,
                                label: Text(t.themeSystem),
                              ),
                              ButtonSegment(
                                value: ThemeMode.light,
                                label: Text(t.themeLight),
                              ),
                              ButtonSegment(
                                value: ThemeMode.dark,
                                label: Text(t.themeDark),
                              ),
                            ],
                            selected: <ThemeMode>{mode},
                            onSelectionChanged: (newSelection) {
                              final sel = newSelection.first;
                              if (sel == ThemeMode.system) {
                                context.read<ThemeBloc>().add(
                                  const ThemeEvent.setThemeRequested('system'),
                                );
                              } else if (sel == ThemeMode.light) {
                                context.read<ThemeBloc>().add(
                                  const ThemeEvent.setThemeRequested('light'),
                                );
                              } else {
                                context.read<ThemeBloc>().add(
                                  const ThemeEvent.setThemeRequested('dark'),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Builder(builder: (context) {
                        final locale = Localizations.localeOf(context);
                        String current = 'system';
                        if (locale.languageCode == 'es') current = 'es';
                        if (locale.languageCode == 'en') current = 'en';
                        return SegmentedButton<String>(
                          segments: [
                            ButtonSegment(value: 'system', label: Text(t.languageSystem)),
                            ButtonSegment(value: 'es', label: Text(t.languageSpanish)),
                            ButtonSegment(value: 'en', label: Text(t.languageEnglish)),
                          ],
                          selected: <String>{current},
                          onSelectionChanged: (newSelection) {
                            final sel = newSelection.first;
                            context.read<LocaleBloc>().add(LocaleEvent.setLocaleRequested(sel));
                          },
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: ListTile(
                      title: Text(t.totalUsers),
                      trailing: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              '$usersCount',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: onSurfaceSubtle,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      title: Text(t.totalAddresses),
                      trailing: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              '$addressesCount',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: onSurfaceSubtle,
                              ),
                            ),
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
                                title: Text(t.confirm),
                                content: Text(t.deleteAllAddresses + '?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(c).pop(false),
                                    child: Text(t.cancel),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(c).pop(true),
                                    child: Text(t.delete),
                                  ),
                                ],
                              ),
                            );
                            if (confirmed == true) {
                              if (!context.mounted) return;
                              context.read<SettingsBloc>().add(
                                const SettingsEvent.deleteAllAddressesRequested(),
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.deletingAddresses)));
                            }
                          },
                    style: FilledButton.styleFrom(shape: const StadiumBorder()),
                    child: Text(t.deleteAllAddresses),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.tonal(
                    onPressed: isLoading
                        ? null
                        : () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (c) => AlertDialog(
                                title: Text(t.confirm),
                                content: Text(t.deleteAllUsers + '?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(c).pop(false),
                                    child: Text(t.cancel),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.of(c).pop(true),
                                    child: Text(t.delete),
                                  ),
                                ],
                              ),
                            );
                            if (confirmed == true) {
                              if (!context.mounted) return;
                              context.read<SettingsBloc>().add(
                                const SettingsEvent.deleteAllUsersRequested(),
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.deletingUsers)));
                            }
                          },
                    style: FilledButton.styleFrom(shape: const StadiumBorder()),
                    child: Text(t.deleteAllUsers),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
