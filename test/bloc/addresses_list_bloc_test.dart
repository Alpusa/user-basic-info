import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_bloc.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_event.dart';
import 'package:user_basic_info/presentation/bloc/addresses_list/addresses_list_state.dart';
import 'package:user_basic_info/domain/usecases/get_all_addresses.dart';
import 'package:user_basic_info/domain/usecases/search_addresses.dart';
import 'package:user_basic_info/domain/entities/address.dart';
import 'package:user_basic_info/core/errors/failure.dart';

class MockGetAllAddresses extends Mock implements GetAllAddresses {}
class MockSearchAddresses extends Mock implements SearchAddresses {}

void main() {
  group('AddressesListBloc', () {
    late MockGetAllAddresses getAll;
    late MockSearchAddresses search;
    late AddressesListBloc bloc;
    final items = [
      const Address(id: '1', userId: 'u1', pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1'),
    ];

    setUp(() {
      getAll = MockGetAllAddresses();
      search = MockSearchAddresses();
      bloc = AddressesListBloc(getAll, search);
    });

    blocTest<AddressesListBloc, AddressesListState>(
      'emite loading -> success al cargar',
      build: () {
        when(() => getAll()).thenAnswer((_) async => Right(items));
        return bloc;
      },
      act: (b) => b.add(const LoadRequested()),
      expect: () => [
        const AddressesListState.loading(),
        AddressesListState.success(items),
      ],
    );

    blocTest<AddressesListBloc, AddressesListState>(
      'search vacío cae en load',
      build: () {
        when(() => getAll()).thenAnswer((_) async => Right(items));
        return bloc;
      },
      act: (b) => b.add(const SearchRequested(query: '')),
      expect: () => [
        const AddressesListState.loading(),
        AddressesListState.success(items),
      ],
    );

    blocTest<AddressesListBloc, AddressesListState>(
      'search con filtros emite loading -> success',
      build: () {
        when(() => search(userId: any(named: 'userId'), pais: any(named: 'pais'), departamento: any(named: 'departamento'), municipio: any(named: 'municipio'), containsText: any(named: 'containsText')))
            .thenAnswer((_) async => Right(items));
        return bloc;
      },
      act: (b) => b.add(const SearchRequested(query: 'Calle')),
      expect: () => [
        const AddressesListState.loading(),
        AddressesListState.success(items),
      ],
    );

    blocTest<AddressesListBloc, AddressesListState>(
      'propaga failure',
      build: () {
        when(() => getAll()).thenAnswer((_) async => const Left(Failure.unexpected()));
        return bloc;
      },
      act: (b) => b.add(const LoadRequested()),
      expect: () => [
        const AddressesListState.loading(),
        isA<AddressesListState>().having((s) => s, 'failure', isNotNull),
      ],
    );
  });
}
