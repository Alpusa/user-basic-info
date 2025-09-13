import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

import 'package:user_basic_info/presentation/bloc/users_list/users_list_bloc.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_event.dart';
import 'package:user_basic_info/presentation/bloc/users_list/users_list_state.dart';
import 'package:user_basic_info/domain/usecases/get_all_users.dart';
import 'package:user_basic_info/domain/usecases/search_users.dart';
import 'package:user_basic_info/domain/entities/user.dart';
import 'package:user_basic_info/core/errors/failure.dart';

class MockGetAllUsers extends Mock implements GetAllUsers {}
class MockSearchUsers extends Mock implements SearchUsers {}

void main() {
  setUpAll(() {
    registerFallbackValue(DateTime.now());
  });

  group('UsersListBloc', () {
    late MockGetAllUsers getAll;
    late MockSearchUsers search;
    late UsersListBloc bloc;
    final items = [
      User(id: '1', nombre: 'A', apellido: 'B', fechaNacimiento: DateTime(2000,1,1)),
    ];

    setUp(() {
      getAll = MockGetAllUsers();
      search = MockSearchUsers();
      bloc = UsersListBloc(getAll, search);
    });

    blocTest<UsersListBloc, UsersListState>(
      'emite loading -> success al cargar',
      build: () {
        when(() => getAll()).thenAnswer((_) async => Right(items));
        return bloc;
      },
      act: (b) => b.add(const LoadRequested()),
      expect: () => [
        const UsersListState.loading(),
        UsersListState.success(items),
      ],
    );

    blocTest<UsersListBloc, UsersListState>(
      'search vacío cae en load',
      build: () {
        when(() => getAll()).thenAnswer((_) async => Right(items));
        return bloc;
      },
      act: (b) => b.add(const SearchRequested('   ')),
      expect: () => [
        const UsersListState.loading(),
        UsersListState.success(items),
      ],
    );

    blocTest<UsersListBloc, UsersListState>(
      'search con query emite loading -> success',
      build: () {
        when(() => search(query: any(named: 'query'), nombre: any(named: 'nombre'), apellido: any(named: 'apellido'), bornAfter: any(named: 'bornAfter'), bornBefore: any(named: 'bornBefore')))
            .thenAnswer((_) async => Right(items));
        return bloc;
      },
      act: (b) => b.add(const SearchRequested('A')),
      expect: () => [
        const UsersListState.loading(),
        UsersListState.success(items),
      ],
    );

    blocTest<UsersListBloc, UsersListState>(
      'propaga failure',
      build: () {
        when(() => getAll()).thenAnswer((_) async => const Left(Failure.unexpected()));
        return bloc;
      },
      act: (b) => b.add(const LoadRequested()),
      expect: () => [
        const UsersListState.loading(),
        isA<UsersListState>().having((s) => s, 'failure', isNotNull),
      ],
    );
  });
}
