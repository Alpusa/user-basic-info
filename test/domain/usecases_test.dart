import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

import 'package:user_basic_info/domain/usecases/get_all_users.dart';
import 'package:user_basic_info/domain/usecases/search_users.dart';
import 'package:user_basic_info/domain/usecases/get_user_by_id.dart';
import 'package:user_basic_info/domain/usecases/save_user.dart';
import 'package:user_basic_info/domain/usecases/update_user.dart';
import 'package:user_basic_info/domain/usecases/delete_user.dart';
import 'package:user_basic_info/domain/usecases/get_all_addresses.dart';
import 'package:user_basic_info/domain/usecases/search_addresses.dart';
import 'package:user_basic_info/domain/usecases/get_address_by_id.dart';
import 'package:user_basic_info/domain/usecases/get_addresses_by_user_id.dart';
import 'package:user_basic_info/domain/usecases/save_address.dart';
import 'package:user_basic_info/domain/usecases/update_address.dart';
import 'package:user_basic_info/domain/usecases/delete_address.dart';
import 'package:user_basic_info/domain/usecases/get_theme_preference.dart';
import 'package:user_basic_info/domain/usecases/save_theme_preference.dart';
import 'package:user_basic_info/domain/usecases/get_locale_preference.dart';
import 'package:user_basic_info/domain/usecases/save_locale_preference.dart';

import 'package:user_basic_info/domain/repositories/user_repository.dart';
import 'package:user_basic_info/domain/repositories/address_repository.dart';
import 'package:user_basic_info/domain/repositories/preferences_repository.dart';

import 'package:user_basic_info/domain/entities/user.dart' as du;
import 'package:user_basic_info/domain/entities/address.dart' as da;

class MockUserRepository extends Mock implements UserRepository {}
class MockAddressRepository extends Mock implements AddressRepository {}
class MockPreferencesRepository extends Mock implements PreferencesRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(du.User(id: '1', nombre: 'N', apellido: 'A', fechaNacimiento: DateTime(2000,1,1)));
    registerFallbackValue(da.Address(id: '1', userId: '1', pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1'));
  });

  group('User usecases', () {
    late MockUserRepository repo;

    setUp(() => repo = MockUserRepository());

    test('GetAllUsers calls repo', () async {
      when(() => repo.getAllUsers()).thenAnswer((_) async => const Right(<du.User>[]));
      final uc = GetAllUsers(repo);
      final res = await uc();
      expect(res, isA<Right>());
      verify(() => repo.getAllUsers()).called(1);
    });

    test('SearchUsers calls repo with params', () async {
      when(() => repo.searchUsers(query: any(named: 'query'), nombre: any(named: 'nombre'), apellido: any(named: 'apellido'), bornAfter: any(named: 'bornAfter'), bornBefore: any(named: 'bornBefore')))
          .thenAnswer((_) async => const Right(<du.User>[]));
      final uc = SearchUsers(repo);
      await uc(query: 'a');
      verify(() => repo.searchUsers(query: any(named: 'query'), nombre: any(named: 'nombre'), apellido: any(named: 'apellido'), bornAfter: any(named: 'bornAfter'), bornBefore: any(named: 'bornBefore'))).called(1);
    });

    test('GetUserById calls repo', () async {
      when(() => repo.getUserById('1')).thenAnswer((_) async => const Right(null));
      final uc = GetUserById(repo);
      await uc('1');
      verify(() => repo.getUserById('1')).called(1);
    });

    test('SaveUser calls repo', () async {
      when(() => repo.saveUser(any())).thenAnswer((_) async => const Right(unit));
      final uc = SaveUser(repo);
      await uc(du.User(id: '1', nombre: 'N', apellido: 'A', fechaNacimiento: DateTime(2000,1,1)));
      verify(() => repo.saveUser(any())).called(1);
    });

    test('UpdateUser calls repo', () async {
      when(() => repo.updateUser(any())).thenAnswer((_) async => const Right(unit));
      final uc = UpdateUser(repo);
      await uc(du.User(id: '1', nombre: 'N', apellido: 'A', fechaNacimiento: DateTime(2000,1,1)));
      verify(() => repo.updateUser(any())).called(1);
    });

    test('DeleteUser calls repo', () async {
      when(() => repo.deleteUser('1')).thenAnswer((_) async => const Right(unit));
      final uc = DeleteUser(repo);
      await uc('1');
      verify(() => repo.deleteUser('1')).called(1);
    });
  });

  group('Address usecases', () {
    late MockAddressRepository repo;

    setUp(() => repo = MockAddressRepository());

    test('GetAllAddresses calls repo', () async {
      when(() => repo.getAllAddresses()).thenAnswer((_) async => const Right(<da.Address>[]));
      final uc = GetAllAddresses(repo);
      await uc();
      verify(() => repo.getAllAddresses()).called(1);
    });

    test('SearchAddresses calls repo with params', () async {
      when(() => repo.searchAddresses(userId: any(named: 'userId'), pais: any(named: 'pais'), departamento: any(named: 'departamento'), municipio: any(named: 'municipio'), containsText: any(named: 'containsText')))
          .thenAnswer((_) async => const Right(<da.Address>[]));
      final uc = SearchAddresses(repo);
      await uc(containsText: 'x');
      verify(() => repo.searchAddresses(userId: any(named: 'userId'), pais: any(named: 'pais'), departamento: any(named: 'departamento'), municipio: any(named: 'municipio'), containsText: any(named: 'containsText'))).called(1);
    });

    test('GetAddressById calls repo', () async {
      when(() => repo.getAddressById('1')).thenAnswer((_) async => const Right(null));
      final uc = GetAddressById(repo);
      await uc('1');
      verify(() => repo.getAddressById('1')).called(1);
    });

    test('GetAddressesByUserId calls repo', () async {
      when(() => repo.getAddressesByUserId('1')).thenAnswer((_) async => const Right(<da.Address>[]));
      final uc = GetAddressesByUserId(repo);
      await uc('1');
      verify(() => repo.getAddressesByUserId('1')).called(1);
    });

    test('SaveAddress calls repo', () async {
      when(() => repo.saveAddressForUser(any(), any())).thenAnswer((_) async => const Right(unit));
      final uc = SaveAddress(repo);
      await uc(
        du.User(id: '1', nombre: 'N', apellido: 'A', fechaNacimiento: DateTime(2000,1,1)),
        const da.Address(id: null, userId: '1', pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1'),
      );
      verify(() => repo.saveAddressForUser(any(), any())).called(1);
    });

    test('UpdateAddress calls repo', () async {
      when(() => repo.updateAddress(any(), any())).thenAnswer((_) async => const Right(unit));
      final uc = UpdateAddress(repo);
      await uc('1', const da.Address(id: '1', userId: '1', pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1'));
      verify(() => repo.updateAddress(any(), any())).called(1);
    });

    test('DeleteAddress calls repo', () async {
      when(() => repo.deleteAddress('1')).thenAnswer((_) async => const Right(unit));
      final uc = DeleteAddress(repo);
      await uc('1');
      verify(() => repo.deleteAddress('1')).called(1);
    });

    test('DeleteAddressesByUserId calls repo', () async {
      when(() => repo.deleteAddressesByUserId('1')).thenAnswer((_) async => const Right(unit));
      final uc = DeleteAddressesByUserId(repo);
      await uc('1');
      verify(() => repo.deleteAddressesByUserId('1')).called(1);
    });
  });

  group('Preferences usecases', () {
    late MockPreferencesRepository repo;
    setUp(() => repo = MockPreferencesRepository());

    test('GetThemePreference llama repo', () async {
      when(() => repo.getTheme()).thenAnswer((_) async => 'dark');
      final uc = GetThemePreference(repo);
      final res = await uc();
      expect(res, 'dark');
    });

    test('SaveThemePreference llama repo', () async {
      when(() => repo.saveTheme(any())).thenAnswer((_) async {});
      final uc = SaveThemePreference(repo);
      await uc('light');
      verify(() => repo.saveTheme('light')).called(1);
    });

    test('GetLocalePreference llama repo', () async {
      when(() => repo.getLocale()).thenAnswer((_) async => 'es');
      final uc = GetLocalePreference(repo);
      final res = await uc();
      expect(res, 'es');
    });

    test('SaveLocalePreference llama repo', () async {
      when(() => repo.saveLocale(any())).thenAnswer((_) async {});
      final uc = SaveLocalePreference(repo);
      await uc('en');
      verify(() => repo.saveLocale('en')).called(1);
    });
  });
}
