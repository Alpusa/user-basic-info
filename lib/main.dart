import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/router/app_router.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
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
  }
}