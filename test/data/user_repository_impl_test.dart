import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';
import 'package:fpdart/fpdart.dart';

import 'package:user_basic_info/data/repositories/user_repository_impl.dart';
import 'package:user_basic_info/data/models/user/user_model.dart';
import 'package:user_basic_info/domain/entities/user.dart' as d;
import 'package:user_basic_info/domain/repositories/address_repository.dart';
// no need to import Failure directly; pattern matching via when is enough

class MockUserBox extends Mock implements Box<UserModel> {}

class MockAddressRepository extends Mock implements AddressRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      UserModel(id: 'x', nombre: 'n', apellido: 'a', fechaNacimiento: DateTime(2000, 1, 1)),
    );
  });
  late MockUserBox usersBox;
  late MockAddressRepository addressRepo;
  late UserRepositoryImpl repo;

  setUp(() {
    usersBox = MockUserBox();
    addressRepo = MockAddressRepository();
    repo = UserRepositoryImpl(usersBox, addressRepo);
  });

  group('saveUser', () {
    test('genera id cuando está vacío y guarda en box', () async {
      when(() => usersBox.put(any(), any())).thenAnswer((_) async {});

      final user = d.User(id: '', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1));
      final res = await repo.saveUser(user);

      expect(res.isRight(), true);
      final captured = verify(() => usersBox.put(captureAny(), captureAny())).captured;
      final id = captured[0] as String;
      final model = captured[1] as UserModel;
      expect(id.isNotEmpty, true);
      expect(model.id, id);
      expect(model.nombre, 'Ana');
      expect(model.apellido, 'Lopez');
      expect(model.fechaNacimiento, DateTime(2000, 1, 1));
    });

    test('usa id existente cuando no está vacío', () async {
      when(() => usersBox.put(any(), any())).thenAnswer((_) async {});

      final user = d.User(id: 'u1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1));
      final res = await repo.saveUser(user);

      expect(res.isRight(), true);
      verify(() => usersBox.put('u1', any(that: isA<UserModel>()))).called(1);
    });

    test('mapea errores a Failure.unexpected por defecto', () async {
      when(() => usersBox.put(any(), any())).thenThrow(Exception('algo raro'));

      final user = d.User(id: 'u1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1));
      final res = await repo.saveUser(user);

      expect(res.isLeft(), true);
      res.match(
        (l) => l.when(
          unexpected: (msg) {
            expect(msg, contains('algo raro'));
          },
          network: (_) => fail('no debe ser network'),
          notFound: (_) => fail('no debe ser notFound'),
          validation: (_) => fail('no debe ser validation'),
        ),
        (_) => fail('esperaba Left'),
      );
    });
  });

  group('getUserById', () {
    test('retorna usuario mapeado cuando existe', () async {
      when(() => usersBox.get('u1')).thenReturn(
        UserModel(id: 'u1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1)),
      );

      final res = await repo.getUserById('u1');
      expect(res.isRight(), true);
      res.match((_) => fail('esperaba Right'), (u) {
        expect(u!.id, 'u1');
        expect(u.nombre, 'Ana');
        expect(u.apellido, 'Lopez');
        expect(u.fechaNacimiento, DateTime(2000, 1, 1));
      });
    });

    test('retorna null cuando no existe', () async {
      when(() => usersBox.get('u1')).thenReturn(null);
      final res = await repo.getUserById('u1');
      res.match((_) => fail('esperaba Right'), (u) => expect(u, isNull));
    });
  });

  group('getAllUsers', () {
    test('mapea todos los modelos a entidades', () async {
      when(() => usersBox.values).thenReturn([
        UserModel(id: '1', nombre: 'A', apellido: 'X', fechaNacimiento: DateTime(1990, 1, 1)),
        UserModel(id: '2', nombre: 'B', apellido: 'Y', fechaNacimiento: DateTime(1995, 2, 2)),
      ]);

      final res = await repo.getAllUsers();
      res.match((_) => fail('esperaba Right'), (list) {
        expect(list, hasLength(2));
        expect(list.first.id, '1');
        expect(list.last.nombre, 'B');
      });
    });

    test('mapea error de red a Failure.network', () async {
      when(() => usersBox.values).thenThrow(Exception('network timeout'));
      final res = await repo.getAllUsers();
      expect(res.isLeft(), true);
      res.match(
        (l) => l.when(
          network: (msg) => expect(msg, contains('network')),
          unexpected: (_) => fail('debe ser network'),
          notFound: (_) => fail('no aplica'),
          validation: (_) => fail('no aplica'),
        ),
        (_) => fail('esperaba Left'),
      );
    });
  });

  group('searchUsers', () {
    final models = [
      UserModel(id: '1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1)),
      UserModel(id: '2', nombre: 'Luis', apellido: 'PEREZ', fechaNacimiento: DateTime(1990, 5, 10)),
      UserModel(id: '3', nombre: 'Lucia', apellido: 'Gomez', fechaNacimiento: DateTime(2010, 3, 20)),
    ];

    test('filtra por query general', () async {
      when(() => usersBox.values).thenReturn(models);
      final res = await repo.searchUsers(query: 'lu');
      res.match((_) => fail('esperaba Right'), (list) {
        expect(list.map((e) => e.id), containsAll(['2', '3']));
        expect(list.any((e) => e.id == '1'), false);
      });
    });

    test('filtra por nombre y apellido', () async {
      when(() => usersBox.values).thenReturn(models);
      final res = await repo.searchUsers(nombre: 'ana', apellido: 'perez');
      res.match((_) => fail('Right esperado'), (list) {
        // nombre=ana devuelve 1; apellido=perez devuelve 1 distinto; intersección vacía
        expect(list, isEmpty);
      });
    });

    test('filtra por bornAfter y bornBefore', () async {
      when(() => usersBox.values).thenReturn(models);
      final res = await repo.searchUsers(bornAfter: DateTime(1995, 1, 1), bornBefore: DateTime(2005, 1, 1));
      res.match((_) => fail('Right esperado'), (list) {
        expect(list, hasLength(1));
        expect(list.single.id, '1');
      });
    });
  });

  group('updateUser', () {
    test('cuando existe, actualiza sobre el mismo id', () async {
      when(() => usersBox.containsKey('u1')).thenReturn(true);
      when(() => usersBox.put(any(), any())).thenAnswer((_) async {});

      final res = await repo.updateUser(
        d.User(id: 'u1', nombre: 'Nuevo', apellido: 'Apellido', fechaNacimiento: DateTime(2001, 1, 1)),
      );

      expect(res.isRight(), true);
      verify(() => usersBox.put('u1', any(that: isA<UserModel>()))).called(1);
    });

    test('cuando no existe, delega a saveUser (guarda)', () async {
      when(() => usersBox.containsKey('u1')).thenReturn(false);
      when(() => usersBox.put(any(), any())).thenAnswer((_) async {});

      final res = await repo.updateUser(
        d.User(id: 'u1', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1)),
      );

      expect(res.isRight(), true);
      verify(() => usersBox.put('u1', any(that: isA<UserModel>()))).called(1);
    });
  });

  group('deleteUser', () {
    test('hace cascade delete de direcciones y borra usuario', () async {
      when(() => addressRepo.deleteAddressesByUserId('u1'))
          .thenAnswer((_) async => right(unit));
      when(() => usersBox.delete('u1')).thenAnswer((_) async {});

      final res = await repo.deleteUser('u1');
      expect(res.isRight(), true);
      verifyInOrder([
        () => addressRepo.deleteAddressesByUserId('u1'),
        () => usersBox.delete('u1'),
      ]);
    });

    test('si box.delete lanza excepción, mapea a Failure', () async {
      when(() => addressRepo.deleteAddressesByUserId('u1'))
          .thenAnswer((_) async => right(unit));
      when(() => usersBox.delete('u1')).thenThrow(Exception('not found'));

      final res = await repo.deleteUser('u1');
      expect(res.isLeft(), true);
      res.match(
        (l) => l.when(
          notFound: (msg) => expect(msg, contains('not found')),
          unexpected: (_) => fail('debe ser notFound'),
          network: (_) => fail('no aplica'),
          validation: (_) => fail('no aplica'),
        ),
        (_) => fail('esperaba Left'),
      );
    });
  });
}
