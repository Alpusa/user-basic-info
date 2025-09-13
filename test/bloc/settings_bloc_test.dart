import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

import 'package:user_basic_info/presentation/bloc/settings/settings_bloc.dart';
import 'package:user_basic_info/presentation/bloc/settings/settings_event.dart';
import 'package:user_basic_info/presentation/bloc/settings/settings_state.dart';
import 'package:user_basic_info/domain/usecases/get_all_users.dart';
import 'package:user_basic_info/domain/usecases/get_all_addresses.dart';
import 'package:user_basic_info/domain/usecases/delete_user.dart';
import 'package:user_basic_info/domain/usecases/delete_address.dart';
import 'package:user_basic_info/domain/entities/user.dart';
import 'package:user_basic_info/domain/entities/address.dart';

class MockGetAllUsers extends Mock implements GetAllUsers {}
class MockGetAllAddresses extends Mock implements GetAllAddresses {}
class MockDeleteUser extends Mock implements DeleteUser {}
class MockDeleteAddress extends Mock implements DeleteAddress {}

void main() {
  group('SettingsBloc', () {
    late MockGetAllUsers getAllUsers;
    late MockGetAllAddresses getAllAddresses;
    late MockDeleteUser deleteUser;
    late MockDeleteAddress deleteAddress;
    late SettingsBloc bloc;

    setUp(() {
      getAllUsers = MockGetAllUsers();
      getAllAddresses = MockGetAllAddresses();
      deleteUser = MockDeleteUser();
      deleteAddress = MockDeleteAddress();
      bloc = SettingsBloc(getAllUsers, getAllAddresses, deleteUser, deleteAddress);
    });

    blocTest<SettingsBloc, SettingsState>(
      'load emite loading -> success con conteos',
      build: () {
        when(() => getAllUsers()).thenAnswer((_) async => Right([
          User(id: '1', nombre: 'A', apellido: 'B', fechaNacimiento: DateTime(2000,1,1)),
        ]));
        when(() => getAllAddresses()).thenAnswer((_) async => Right([
          const Address(id: '1', userId: '1', pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1'),
        ]));
        return bloc;
      },
      act: (b) => b.add(const LoadRequested()),
      expect: () => [
        const SettingsState.loading(),
        const SettingsState.success(usersCount: 1, addressesCount: 1),
      ],
    );

    blocTest<SettingsBloc, SettingsState>(
      'delete all users + reload',
      build: () {
        var callCount = 0;
        when(() => getAllUsers()).thenAnswer((_) async {
          if (callCount == 0) {
            callCount++;
            return Right([
              User(id: '1', nombre: 'A', apellido: 'B', fechaNacimiento: DateTime(2000,1,1)),
            ]);
          }
          return const Right([]);
        });
        when(() => deleteUser(any())).thenAnswer((_) async => const Right(unit));
        when(() => getAllAddresses()).thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (b) => b.add(const DeleteAllUsersRequested()),
      expect: () => [
        const SettingsState.loading(),
        const SettingsState.success(usersCount: 0, addressesCount: 0),
        const SettingsState.loading(),
        const SettingsState.success(usersCount: 0, addressesCount: 0),
      ],
    );

    blocTest<SettingsBloc, SettingsState>(
      'delete all addresses + reload',
      build: () {
        var callCount = 0;
        when(() => getAllAddresses()).thenAnswer((_) async {
          if (callCount == 0) {
            callCount++;
            return Right([
              const Address(
                  id: '1',
                  userId: '1',
                  pais: 'CO',
                  departamento: 'ANT',
                  municipio: 'MED',
                  direccion: 'Calle 1')
            ]);
          }
          return const Right([]);
        });
        when(() => deleteAddress(any())).thenAnswer((_) async => const Right(unit));
        when(() => getAllUsers()).thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (b) => b.add(const DeleteAllAddressesRequested()),
      expect: () => [
        const SettingsState.loading(),
        const SettingsState.success(usersCount: 0, addressesCount: 0),
        const SettingsState.loading(),
        const SettingsState.success(usersCount: 0, addressesCount: 0),
      ],
    );
  });
}
