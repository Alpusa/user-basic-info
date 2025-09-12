import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../presentation/pages/user_form_page.dart';
import 'names_router.dart'; // reuse the counter page as home

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: NamesRouter.userForm,
      builder: (context, state) {
        return _responsiveWrapper(context, const UserFormPage());
      },
    ),
  ],
);

Widget _responsiveWrapper(BuildContext context, Widget child) {
  return ResponsiveScaledBox(
    width: ResponsiveValue<double>(
      context,
      conditionalValues: [
        Condition.equals(
          name: MOBILE,
          value: 420,
        ), // Hasta 480px (Móviles pequeños)
        Condition.between(
          start: 481,
          end: 768,
          value: 540,
        ), // Entre 481px y 768px (Tablets pequeñas y celulares grandes)
        Condition.between(
          start: 769,
          end: 1024,
          value: 900,
        ), // Entre 769px y 1024px (Laptops pequeñas y tablets grandes)
        Condition.between(
          start: 1025,
          end: 1440,
          value: 1100,
        ), // Entre 1025px y 1440px (Laptops grandes y escritorios estándar)
        Condition.between(
          start: 1441,
          end: 2560,
          value: 1200,
        ), // Entre 1441px y 2560px (Monitores grandes y ultrawide)
        Condition.largerThan(
          name: '4K',
          value: 1600,
        ), // Más de 2560px (4K y superiores)
      ],
      defaultValue: 1200,
    ).value,
    child: child,
  );

  //
}
