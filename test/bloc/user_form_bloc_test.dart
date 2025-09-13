import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

import 'package:user_basic_info/presentation/bloc/user_form/user_form_bloc.dart';
import 'package:user_basic_info/presentation/bloc/user_form/user_form_event.dart';
import 'package:user_basic_info/presentation/bloc/user_form/user_form_state.dart';
import 'package:user_basic_info/domain/usecases/save_user.dart';
import 'package:user_basic_info/domain/usecases/update_user.dart';
import 'package:user_basic_info/domain/usecases/get_user_by_id.dart';
import 'package:user_basic_info/domain/entities/user.dart' as d;

class MockSaveUser extends Mock implements SaveUser {}
class MockUpdateUser extends Mock implements UpdateUser {}
class MockGetUserById extends Mock implements GetUserById {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      d.User(id: 'x', nombre: 'n', apellido: 'a', fechaNacimiento: DateTime(2000,1,1)),
    );
  });
  group('UserFormBloc', () {
    late MockSaveUser save;
    late MockUpdateUser update;
    late MockGetUserById getById;

    setUp(() {
      save = MockSaveUser();
      update = MockUpdateUser();
      getById = MockGetUserById();
    });

    blocTest<UserFormBloc, UserFormState>(
      'initialized con id carga datos',
      build: () {
        when(() => getById('1')).thenAnswer((_) async => Right(d.User(id: '1', nombre: 'N', apellido: 'A', fechaNacimiento: DateTime(2000,1,1))));
        return UserFormBloc(save, update, getById);
      },
      act: (b) => b.add(const UserFormEvent.initialized('1')),
      expect: () => [
        isA<UserFormState>().having((s) => s.isEdit, 'isEdit', true),
      ],
    );

    blocTest<UserFormBloc, UserFormState>(
      'submitPressed con datos inválidos solo quita isSubmitting',
      build: () => UserFormBloc(save, update, getById),
  act: (b) => b.add(const UserFormEvent.submitPressed(nombre: '', apellido: '', fechaNacimiento: '')),
      expect: () => [
        isA<UserFormState>().having((s) => s.isSubmitting, 'isSubmitting', true),
        isA<UserFormState>().having((s) => s.isSubmitting, 'isSubmitting', false),
      ],
    );

    blocTest<UserFormBloc, UserFormState>(
      'submitPressed falla si fecha en el futuro',
      build: () => UserFormBloc(save, update, getById),
      act: (b) {
        final future = DateTime.now().add(const Duration(days: 1));
        final date = '${future.day.toString().padLeft(2,'0')}/${future.month.toString().padLeft(2,'0')}/${future.year}';
  b.add(UserFormEvent.submitPressed(nombre: 'N', apellido: 'A', fechaNacimiento: date));
      },
      expect: () => [
        isA<UserFormState>().having((s) => s.isSubmitting, 'isSubmitting', true),
        isA<UserFormState>().having((s) => s.failure, 'failure', isNotNull),
      ],
    );

    blocTest<UserFormBloc, UserFormState>(
      'submitPressed guarda nuevo usuario',
      build: () {
        when(() => save(any())).thenAnswer((_) async => const Right(unit));
        return UserFormBloc(save, update, getById);
      },
  act: (b) => b.add(const UserFormEvent.submitPressed(nombre: 'N', apellido: 'A', fechaNacimiento: '01/01/2000')),
      expect: () => [
        isA<UserFormState>().having((s) => s.isSubmitting, 'isSubmitting', true),
        isA<UserFormState>().having((s) => s.isSuccess, 'isSuccess', true),
      ],
    );

    blocTest<UserFormBloc, UserFormState>(
      'submitPressed actualiza si isEdit',
      build: () {
        when(() => update(any())).thenAnswer((_) async => const Right(unit));
        final bloc = UserFormBloc(save, update, getById);
        // Forzar estado de edición
        bloc.emit(bloc.state.copyWith(isEdit: true, id: '1'));
        return bloc;
      },
  act: (b) => b.add(const UserFormEvent.submitPressed(nombre: 'N', apellido: 'A', fechaNacimiento: '01/01/2000')),
      expect: () => [
        isA<UserFormState>().having((s) => s.isSubmitting, 'isSubmitting', true),
        isA<UserFormState>().having((s) => s.isSuccess, 'isSuccess', true),
      ],
    );
  });
}
