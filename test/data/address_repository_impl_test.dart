import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';

import 'package:user_basic_info/data/repositories/address_repository_impl.dart';
import 'package:user_basic_info/data/models/address/address_model.dart';
import 'package:user_basic_info/data/models/user/user_model.dart';
import 'package:user_basic_info/domain/entities/address.dart' as d;
import 'package:user_basic_info/domain/entities/user.dart' as d;

class MockAddressBox extends Mock implements Box<AddressModel> {}
class MockUserBox extends Mock implements Box<UserModel> {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      UserModel(id: 'uX', nombre: 'N', apellido: 'A', fechaNacimiento: DateTime(2000, 1, 1)),
    );
    registerFallbackValue(
      AddressModel(id: 'aX', userId: 'uX', pais: 'P', departamento: 'D', municipio: 'M', direccion: 'Dir'),
    );
  });
  late MockAddressBox addrBox;
  late MockUserBox userBox;
  late AddressRepositoryImpl repo;

  setUp(() {
    addrBox = MockAddressBox();
    userBox = MockUserBox();
    repo = AddressRepositoryImpl(addrBox, userBox);
  });

  group('saveAddressForUser', () {
    test('guarda user (si id vacío genera uno) y address', () async {
      when(() => userBox.put(any(), any())).thenAnswer((_) async {});
      when(() => addrBox.put(any(), any())).thenAnswer((_) async {});

      final u = d.User(id: '', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1));
      final a = d.Address(pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Calle 1');
      final res = await repo.saveAddressForUser(u, a);
      expect(res.isRight(), true);

      // user guardado con id generado
      final uCaptured = verify(() => userBox.put(captureAny(), captureAny())).captured;
      final userId = uCaptured[0] as String;
      final uModel = uCaptured[1] as UserModel;
      expect(userId.isNotEmpty, true);
      expect(uModel.id, userId);

      // address guardada con id generado y userId enlazado
      final aCaptured = verify(() => addrBox.put(captureAny(), captureAny())).captured;
      final addrId = aCaptured[0] as String;
      final aModel = aCaptured[1] as AddressModel;
      expect(addrId.isNotEmpty, true);
      expect(aModel.userId, userId);
      expect(aModel.pais, 'CO');
      expect(aModel.direccion, 'Calle 1');
    });

    test('mapea errores a Failure.unexpected por defecto', () async {
      when(() => userBox.put(any(), any())).thenThrow(Exception('boom'));

      final u = d.User(id: '', nombre: 'Ana', apellido: 'Lopez', fechaNacimiento: DateTime(2000, 1, 1));
      final a = d.Address(pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Calle 1');
      final res = await repo.saveAddressForUser(u, a);
      expect(res.isLeft(), true);
    });
  });

  group('getAddressById', () {
    test('retorna entidad cuando existe', () async {
      when(() => addrBox.get('a1')).thenReturn(
        AddressModel(id: 'a1', userId: 'u1', pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Calle 1'),
      );
      final res = await repo.getAddressById('a1');
      res.match((_) => fail('Right esperado'), (a) {
        expect(a!.id, 'a1');
        expect(a.pais, 'CO');
      });
    });

    test('retorna null cuando no existe', () async {
      when(() => addrBox.get('a1')).thenReturn(null);
      final res = await repo.getAddressById('a1');
      res.match((_) => fail('Right esperado'), (a) => expect(a, isNull));
    });
  });

  group('getAllAddresses & getAddressesByUserId', () {
    final list = [
      AddressModel(id: 'a1', userId: 'u1', pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Calle 1'),
      AddressModel(id: 'a2', userId: 'u2', pais: 'AR', departamento: 'BA', municipio: 'CABA', direccion: 'Av 9 de Julio'),
    ];

    test('getAllAddresses mapea todos', () async {
      when(() => addrBox.values).thenReturn(list);
      final res = await repo.getAllAddresses();
      res.match((_) => fail('Right esperado'), (l) {
        expect(l, hasLength(2));
        expect(l.first.id, 'a1');
      });
    });

    test('getAddressesByUserId filtra por user', () async {
      when(() => addrBox.values).thenReturn(list);
      final res = await repo.getAddressesByUserId('u2');
      res.match((_) => fail('Right esperado'), (l) {
        expect(l, hasLength(1));
        expect(l.single.id, 'a2');
      });
    });
  });

  group('searchAddresses', () {
    final list = [
      AddressModel(id: 'a1', userId: 'u1', pais: 'CO', departamento: 'ANT', municipio: 'Medellín', direccion: 'Calle 1'),
      AddressModel(id: 'a2', userId: 'u2', pais: 'AR', departamento: 'BA', municipio: 'CABA', direccion: 'Av 9 de Julio'),
      AddressModel(id: 'a3', userId: 'u1', pais: 'CO', departamento: 'CUN', municipio: 'Bogotá', direccion: 'Cra 7'),
    ];

    test('filtra por userId y containsText (case-insensitive)', () async {
      when(() => addrBox.values).thenReturn(list);
      final res = await repo.searchAddresses(userId: 'u1', containsText: 'calle');
      res.match((_) => fail('Right esperado'), (l) {
        expect(l.map((e) => e.id), contains('a1'));
        expect(l.any((e) => e.id == 'a2'), false);
      });
    });

    test('filtra por campos específicos', () async {
      when(() => addrBox.values).thenReturn(list);
      final res = await repo.searchAddresses(pais: 'co', departamento: 'cun', municipio: 'bog');
      res.match((_) => fail('Right esperado'), (l) {
        expect(l, hasLength(1));
        expect(l.single.id, 'a3');
      });
    });
  });

  group('updateAddress', () {
    test('si no existe retorna Failure.notFound', () async {
      when(() => addrBox.get('a1')).thenReturn(null);
      final res = await repo.updateAddress('a1', d.Address(pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Calle'));
      expect(res.isLeft(), true);
    });

    test('si existe actualiza conservando userId si no se provee', () async {
      when(() => addrBox.get('a1')).thenReturn(
        AddressModel(id: 'a1', userId: 'u1', pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Calle 1'),
      );
      when(() => addrBox.put('a1', any())).thenAnswer((_) async {});

      final res = await repo.updateAddress('a1', d.Address(pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Nueva'));
      expect(res.isRight(), true);
      final captured = verify(() => addrBox.put('a1', captureAny())).captured.single as AddressModel;
      expect(captured.userId, 'u1');
      expect(captured.direccion, 'Nueva');
    });
  });

  group('deleteAddress', () {
    test('borra por id', () async {
      when(() => addrBox.delete('a1')).thenAnswer((_) async {});
      final res = await repo.deleteAddress('a1');
      expect(res.isRight(), true);
      verify(() => addrBox.delete('a1')).called(1);
    });

    test('mapea error not found cuando delete lanza', () async {
      when(() => addrBox.delete('a1')).thenThrow(Exception('not found'));
      final res = await repo.deleteAddress('a1');
      expect(res.isLeft(), true);
    });
  });

  group('deleteAddressesByUserId', () {
    test('borra todas las direcciones del usuario', () async {
      when(() => addrBox.keys).thenReturn(['a1', 'a2', 'a3']);
      when(() => addrBox.get(any())).thenAnswer((inv) {
        final id = inv.positionalArguments.first as String;
        if (id == 'a1') {
          return AddressModel(id: 'a1', userId: 'u1', pais: 'CO', departamento: 'ANT', municipio: 'Med', direccion: 'Calle 1');
        }
        if (id == 'a2') {
          return AddressModel(id: 'a2', userId: 'u2', pais: 'CO', departamento: 'CUN', municipio: 'Bog', direccion: 'Cra 7');
        }
        return AddressModel(id: 'a3', userId: 'u1', pais: 'CO', departamento: 'CUN', municipio: 'Bog', direccion: 'Calle 10');
      });
      when(() => addrBox.deleteAll(any())).thenAnswer((_) async {});

      final res = await repo.deleteAddressesByUserId('u1');
      expect(res.isRight(), true);
      final keys = verify(() => addrBox.deleteAll(captureAny())).captured.single as Iterable;
      expect(keys, containsAll(['a1', 'a3']));
      expect(keys, isNot(contains('a2')));
    });
  });
}
