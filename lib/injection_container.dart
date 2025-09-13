import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import 'data/models/user/user_model.dart';
import 'data/models/address/address_model.dart';

import 'domain/repositories/user_repository.dart';
import 'domain/usecases/save_theme_preference.dart';
import 'domain/usecases/get_theme_preference.dart';
import 'domain/usecases/save_locale_preference.dart';
import 'domain/usecases/get_locale_preference.dart';
import 'domain/usecases/save_user.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/address_repository.dart';
import 'domain/usecases/save_address.dart';
import 'data/repositories/address_repository_impl.dart';
import 'domain/usecases/get_user_by_id.dart';
import 'domain/usecases/get_all_users.dart';
import 'domain/usecases/search_users.dart';
import 'domain/usecases/get_address_by_id.dart';
import 'domain/usecases/get_all_addresses.dart';
import 'domain/usecases/get_addresses_by_user_id.dart';
import 'domain/usecases/search_addresses.dart';
import 'domain/usecases/update_user.dart';
import 'domain/usecases/delete_user.dart';
import 'domain/usecases/update_address.dart';
import 'domain/usecases/delete_address.dart';
import 'presentation/bloc/users_list/users_list_bloc.dart';
import 'presentation/bloc/user_summary/user_summary_cubit.dart';
import 'presentation/bloc/user_form/user_form_bloc.dart';
import 'presentation/bloc/address_form/address_form_bloc.dart';
import 'presentation/bloc/addresses_list/addresses_list_bloc.dart';
import 'presentation/bloc/settings/settings_bloc.dart';
import 'presentation/bloc/theme/theme_bloc.dart';
import 'presentation/bloc/locale/locale_bloc.dart';
import 'data/models/theme_preference_model.dart';
import 'domain/repositories/preferences_repository.dart';
import 'data/repositories/preferences_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Init Hive (Flutter)
  await Hive.initFlutter();

  // Register Hive adapters
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(AddressModelAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(ThemePreferenceModelAdapter());
  }

  // Open boxes
  final usersBox = await Hive.openBox<UserModel>('users');
  final addressesBox = await Hive.openBox<AddressModel>('addresses');
  final preferencesBox = await Hive.openBox('preferences');

  // Expose boxes via DI
  sl.registerSingleton<Box<UserModel>>(usersBox);
  sl.registerSingleton<Box<AddressModel>>(addressesBox);
  sl.registerSingleton<Box>(preferencesBox);

  // Domain
  // Preference usecases
  sl.registerFactory(() => SaveThemePreference(sl()));
  sl.registerFactory(() => GetThemePreference(sl()));
  sl.registerFactory(() => SaveLocalePreference(sl()));
  sl.registerFactory(() => GetLocalePreference(sl()));

  sl.registerFactory(() => SaveUser(sl()));
  sl.registerFactory(() => SaveAddress(sl()));
  sl.registerFactory(() => GetUserById(sl()));
  sl.registerFactory(() => GetAllUsers(sl()));
  sl.registerFactory(() => SearchUsers(sl()));
  sl.registerFactory(() => GetAddressById(sl()));
  sl.registerFactory(() => GetAllAddresses(sl()));
  sl.registerFactory(() => GetAddressesByUserId(sl()));
  sl.registerFactory(() => SearchAddresses(sl()));
  sl.registerFactory(() => UpdateUser(sl()));
  sl.registerFactory(() => DeleteUser(sl()));
  sl.registerFactory(() => UpdateAddress(sl()));
  sl.registerFactory(() => DeleteAddress(sl()));
  sl.registerFactory(() => DeleteAddressesByUserId(sl()));

  // Data
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl<Box<UserModel>>(), sl<AddressRepository>()),
  );
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(sl<Box<AddressModel>>(), sl<Box<UserModel>>()),
  );

  // Preferences repository (wraps preferences box)
  sl.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(sl<Box>()),
  );

  // Presentation (BLoC/Cubit)
  sl.registerFactory(() => UsersListBloc(sl(), sl()));
  sl.registerFactory(() => AddressesListBloc(sl(), sl()));
  sl.registerFactory(() => UserSummaryCubit(sl(), sl()));
  sl.registerFactory(() => SettingsBloc(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => LocaleBloc(getLocale: sl<GetLocalePreference>(), saveLocale: sl<SaveLocalePreference>(), initial: null));
  // Ensure locale preference model is recognized by Hive (adapter generated separately)
  // ThemeBloc: read stored theme object if exists
  final storedPref = preferencesBox.get('theme_pref') as ThemePreferenceModel?;
  ThemeMode? initialMode;
  if (storedPref != null) {
    switch (storedPref.mode) {
      case 'dark':
        initialMode = ThemeMode.dark;
        break;
      case 'light':
        initialMode = ThemeMode.light;
        break;
      default:
        initialMode = ThemeMode.system;
    }
  }
  sl.registerLazySingleton(
    () => ThemeBloc(getTheme: sl<GetThemePreference>(), saveTheme: sl<SaveThemePreference>(), initial: initialMode),
  );
  sl.registerFactory(
    () => UserFormBloc(
      sl(), // SaveUser
      sl(), // UpdateUser
      sl(), // GetUserById
    ),
  );
  sl.registerFactory(
    () => AddressFormBloc(
      sl(), // SaveAddress
      sl(), // UpdateAddress
      sl(), // GetAddressById
      sl(), // GetUserById
    ),
  );
}
