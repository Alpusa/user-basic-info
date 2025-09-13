import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

import 'package:user_basic_info/presentation/bloc/address_form/address_form_bloc.dart';
import 'package:user_basic_info/presentation/bloc/address_form/address_form_event.dart';
import 'package:user_basic_info/presentation/bloc/address_form/address_form_state.dart';
import 'package:user_basic_info/domain/usecases/save_address.dart';
import 'package:user_basic_info/domain/usecases/update_address.dart';
import 'package:user_basic_info/domain/usecases/get_address_by_id.dart';
import 'package:user_basic_info/domain/usecases/get_user_by_id.dart';
import 'package:user_basic_info/domain/entities/address.dart' as da;
import 'package:user_basic_info/domain/entities/user.dart' as du;

class MockSaveAddress extends Mock implements SaveAddress {}
class MockUpdateAddress extends Mock implements UpdateAddress {}
class MockGetAddressById extends Mock implements GetAddressById {}
class MockGetUserById extends Mock implements GetUserById {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      du.User(id: 'x', nombre: 'n', apellido: 'a', fechaNacimiento: DateTime(2000,1,1)),
    );
    registerFallbackValue(
      const da.Address(id: 'x', userId: 'u', pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle'),
    );
  });
  group('AddressFormBloc', () {
    late MockSaveAddress save;
    late MockUpdateAddress update;
    late MockGetAddressById getById;
    late MockGetUserById getUserById;

    setUp(() {
      save = MockSaveAddress();
      update = MockUpdateAddress();
      getById = MockGetAddressById();
      getUserById = MockGetUserById();
    });

    blocTest<AddressFormBloc, AddressFormState>(
      'initialized con addressId carga datos',
      build: () {
        when(() => getById('1')).thenAnswer((_) async => Right(const da.Address(id: '1', userId: 'u', pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1')));
        return AddressFormBloc(save, update, getById, getUserById);
      },
      act: (b) => b.add(const AddressFormEvent.initialized(addressId: '1', userId: null)),
      expect: () => [
        isA<AddressFormState>().having((s) => s.isEdit, 'isEdit', true),
      ],
    );

    blocTest<AddressFormBloc, AddressFormState>(
      'submitPressed inválido desactiva isSubmitting',
      build: () => AddressFormBloc(save, update, getById, getUserById),
      act: (b) => b.add(const AddressFormEvent.submitPressed(pais: '', departamento: '', municipio: '', direccion: '')),
      expect: () => [
        isA<AddressFormState>().having((s) => s.isSubmitting, 'isSubmitting', true),
        isA<AddressFormState>().having((s) => s.isSubmitting, 'isSubmitting', false),
      ],
    );

    blocTest<AddressFormBloc, AddressFormState>(
      'crear requiere userId válido y existente',
      build: () {
        when(() => getUserById('u1')).thenAnswer((_) async => Right(du.User(id: 'u1', nombre: 'N', apellido: 'A', fechaNacimiento: DateTime(2000,1,1))));
        when(() => save(any(), any())).thenAnswer((_) async => const Right(unit));
        final bloc = AddressFormBloc(save, update, getById, getUserById);
        bloc.emit(bloc.state.copyWith(userId: 'u1'));
        return bloc;
      },
      act: (b) => b.add(const AddressFormEvent.submitPressed(pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1')),
      expect: () => [
        isA<AddressFormState>().having((s) => s.isSubmitting, 'isSubmitting', true),
        isA<AddressFormState>().having((s) => s.isSuccess, 'isSuccess', true),
      ],
    );

    blocTest<AddressFormBloc, AddressFormState>(
      'update requiere id y emite success',
      build: () {
        when(() => update(any(), any())).thenAnswer((_) async => const Right(unit));
        final bloc = AddressFormBloc(save, update, getById, getUserById);
        bloc.emit(bloc.state.copyWith(isEdit: true, id: 'a1', userId: 'u1'));
        return bloc;
      },
      act: (b) => b.add(const AddressFormEvent.submitPressed(pais: 'CO', departamento: 'ANT', municipio: 'MED', direccion: 'Calle 1')),
      expect: () => [
        isA<AddressFormState>().having((s) => s.isSubmitting, 'isSubmitting', true),
        isA<AddressFormState>().having((s) => s.isSuccess, 'isSuccess', true),
      ],
    );
  });
}
