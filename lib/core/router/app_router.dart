import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:user_basic_info/presentation/bloc/user_form/user_form_bloc.dart';
import 'package:user_basic_info/presentation/bloc/user_form/user_form_event.dart';

import '../../presentation/pages/create_or_edit_user_page.dart';
import '../../presentation/pages/users_page.dart';
import '../../presentation/pages/user_summary_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection_container.dart';
import '../../presentation/bloc/users_list/users_list_bloc.dart';
import '../../presentation/bloc/users_list/users_list_event.dart';
import '../../presentation/bloc/user_summary/user_summary_cubit.dart';
import '../../presentation/pages/addresses_page.dart';
import '../../presentation/bloc/addresses_list/addresses_list_bloc.dart';
import '../../presentation/bloc/addresses_list/addresses_list_event.dart';
import '../../presentation/pages/create_or_edit_address_page.dart';
import 'package:user_basic_info/presentation/bloc/address_form/address_form_bloc.dart';
import 'package:user_basic_info/presentation/bloc/address_form/address_form_event.dart';
import '../../presentation/pages/settings_page.dart';
import '../../presentation/bloc/settings/settings_bloc.dart';
import '../../presentation/bloc/settings/settings_event.dart';
import '../../presentation/widgets/navigation_scaffold.dart';
import 'names_router.dart'; // reuse the counter page as home

final GoRouter router = GoRouter(
  initialLocation: NamesRouter.home,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          NavigationScaffold(navigationShell: navigationShell),
      branches: [
        // Users (Home tab) + sibling routes
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamesRouter.home,
              builder: (context, state) => _responsiveWrapper(
                context,
                BlocProvider(
                  create: (_) =>
                      sl<UsersListBloc>()
                        ..add(const UsersListEvent.loadRequested()),
                  child: UsersPage(),
                ),
              ),
            ),
          ],
        ),
        // Addresses
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamesRouter.addresses,
              builder: (context, state) => _responsiveWrapper(
                context,
                BlocProvider(
                  create: (_) => sl<AddressesListBloc>()..add(const AddressesListEvent.loadRequested()),
                  child: const AddressesPage(),
                ),
              ),
            ),
          ],
        ),
        // Settings
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamesRouter.settings,
              builder: (context, state) =>
                  _responsiveWrapper(
                    context,
                    BlocProvider(
                      create: (_) => sl<SettingsBloc>()..add(const SettingsEvent.loadRequested()),
                      child: const SettingsPage(),
                    ),
                  ),
            ),
          ],
        ),
      ],
    ),
    // Address parametrized routes (outside branches)
    GoRoute(
      path: NamesRouter.viewAddress,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return _responsiveWrapper(context, Text('Detalle dirección: $id'));
      },
    ),
    GoRoute(
      path: NamesRouter.createEditAddress,
      builder: (context, state) {
        final id = state.uri.queryParameters['id'];
        final userId = state.uri.queryParameters['userId'];
        return _responsiveWrapper(
          context,
          BlocProvider(
            create: (_) {
              final bloc = sl<AddressFormBloc>();
              bloc.add(AddressFormEvent.initialized(addressId: id, userId: userId));
              return bloc;
            },
            child: CreateOrEditAddressPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: NamesRouter.viewUser,
      builder: (context, state) {
        final id = state.uri.queryParameters['id'];
        return _responsiveWrapper(
          context,
          BlocProvider(
            create: (_) {
              final cubit = sl<UserSummaryCubit>();
              cubit.load(id??'');
              return cubit;
            },
            child: UserSummaryPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: NamesRouter.createEditUser,
      builder: (context, state) {
        final id = state.uri.queryParameters['id'];
        return _responsiveWrapper(
          context,
          BlocProvider(
            create: (_) {
              final bloc = sl<UserFormBloc>();
              bloc.add(UserFormEvent.initialized(id));
              return bloc;
            },
            child: CreateOrEditUserPage(),
          ),
        );
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
