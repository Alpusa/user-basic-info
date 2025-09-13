import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/router/app_router.dart';
import 'core/themes/app_theme.dart';
import 'injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';
import 'presentation/bloc/theme/theme_bloc.dart';
import 'presentation/bloc/theme/theme_state.dart';
import 'presentation/bloc/locale/locale_bloc.dart';
import 'presentation/bloc/locale/locale_state.dart';
import 'presentation/bloc/locale/locale_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  // Load saved locale preference at startup so the app applies it immediately
  sl<LocaleBloc>().add(const LocaleEvent.loadRequested());
  runApp(BlocProvider(create: (_) => sl<ThemeBloc>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeBloc>()),
        BlocProvider(create: (_) => sl<LocaleBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
        final themeMode = state.when(
          initial: (m) => m,
          loading: (m) => m,
          success: (m) => m,
          failure: (_, m) => m,
        );
        return BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            final localeCode = localeState.maybeWhen(
                  success: (c) => c,
                  loading: (c) => c,
                  initial: (c) => c,
                  orElse: () => 'system',
                );
            Locale? appLocale;
            if (localeCode == 'es') appLocale = const Locale('es');
            if (localeCode == 'en') appLocale = const Locale('en');
            return MaterialApp.router(
              title: AppLocalizations.of(context)?.appTitle ?? 'User Basic Info',
              locale: appLocale,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en'), Locale('es')],
              builder: (context, child) {
                final base = ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: const [
                    Breakpoint(start: 0, end: 480, name: MOBILE),
                    Breakpoint(start: 481, end: 768, name: TABLET),
                    Breakpoint(start: 769, end: 1024, name: 'SMALL_DESKTOP'),
                    Breakpoint(start: 1025, end: 1440, name: DESKTOP),
                    Breakpoint(start: 1441, end: 2560, name: 'WIDE_DESKTOP'),
                    Breakpoint(start: 2561, end: double.infinity, name: '4K'),
                  ],
                );
                return base;
              },
            );
          },
        );
      },
      ),
    );
  }
}
