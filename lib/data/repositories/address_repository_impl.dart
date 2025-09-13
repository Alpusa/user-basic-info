import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/address.dart' as d;
import '../../domain/entities/user.dart' as d;
import '../../domain/repositories/address_repository.dart';
import '../models/address/address_model.dart';
import '../models/user/user_model.dart';

class AddressRepositoryImpl implements AddressRepository {
  final Box<AddressModel> _addressesBox = GetIt.I<Box<AddressModel>>();
  final Box<UserModel> _usersBox = GetIt.I<Box<UserModel>>();

  @override
  Future<Either<Failure, Unit>> saveAddressForUser(d.User user, d.Address address) async {
    try {
      final userId = user.id.isEmpty ? const Uuid().v4() : user.id;
      final userModel = UserModel(
        id: userId,
        nombre: user.nombre,
        apellido: user.apellido,
        fechaNacimiento: user.fechaNacimiento,
      );
      await _usersBox.put(userId, userModel);

      final addrId = const Uuid().v4();
      final addrModel = AddressModel(
        id: addrId,
        userId: userId,
        pais: address.pais,
        departamento: address.departamento,
        municipio: address.municipio,
        direccion: address.direccion,
      );
      await _addressesBox.put(addrId, addrModel);
      return right(unit);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, d.Address?>> getAddressById(String id) async {
    try {
      final m = _addressesBox.get(id);
      if (m == null) return right(null);
      return right(d.Address(
        id: m.id,
        pais: m.pais,
        departamento: m.departamento,
        municipio: m.municipio,
        direccion: m.direccion,
      ));
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, List<d.Address>>> getAllAddresses() async {
    try {
      final list = _addressesBox.values
          .map(
            (m) => d.Address(
              id: m.id,
              pais: m.pais,
              departamento: m.departamento,
              municipio: m.municipio,
              direccion: m.direccion,
            ),
          )
          .toList(growable: false);
      return right(list);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, List<d.Address>>> getAddressesByUserId(String userId) async {
    try {
      final list = _addressesBox.values
          .where((m) => m.userId == userId)
          .map(
            (m) => d.Address(
              id: m.id,
              pais: m.pais,
              departamento: m.departamento,
              municipio: m.municipio,
              direccion: m.direccion,
            ),
          )
          .toList(growable: false);
      return right(list);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, List<d.Address>>> searchAddresses({
    String? userId,
    String? pais,
    String? departamento,
    String? municipio,
    String? containsText,
  }) async {
    try {
      Iterable<AddressModel> items = _addressesBox.values;
      if (userId != null) items = items.where((m) => m.userId == userId);
      if (pais != null) {
        final v = pais.toLowerCase();
        items = items.where((m) => m.pais.toLowerCase().contains(v));
      }
      if (departamento != null) {
        final v = departamento.toLowerCase();
        items = items.where((m) => m.departamento.toLowerCase().contains(v));
      }
      if (municipio != null) {
        final v = municipio.toLowerCase();
        items = items.where((m) => m.municipio.toLowerCase().contains(v));
      }
      if (containsText != null && containsText.trim().isNotEmpty) {
        final q = containsText.toLowerCase();
        items = items.where(
          (m) =>
              m.direccion.toLowerCase().contains(q) ||
              m.pais.toLowerCase().contains(q) ||
              m.departamento.toLowerCase().contains(q) ||
              m.municipio.toLowerCase().contains(q),
        );
      }
      final list = items
          .map(
            (m) => d.Address(
              id: m.id,
              pais: m.pais,
              departamento: m.departamento,
              municipio: m.municipio,
              direccion: m.direccion,
            ),
          )
          .toList(growable: false);
      return right(list);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAddress(String id, d.Address address) async {
    try {
      final existing = _addressesBox.get(id);
      if (existing == null) return left(const Failure.notFound('Dirección no existe'));
      final updated = AddressModel(
        id: id,
        userId: address.userId ?? existing.userId,
        pais: address.pais,
        departamento: address.departamento,
        municipio: address.municipio,
        direccion: address.direccion,
      );
      await _addressesBox.put(id, updated);
      return right(unit);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAddress(String id) async {
    try {
      await _addressesBox.delete(id);
      return right(unit);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAddressesByUserId(String userId) async {
    try {
      final keysToDelete = _addressesBox.keys
          .where((k) => _addressesBox.get(k)?.userId == userId)
          .toList(growable: false);
      await _addressesBox.deleteAll(keysToDelete);
      return right(unit);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  Failure _mapError(Object e) {
    final msg = e.toString();
    if (msg.toLowerCase().contains('network')) return Failure.network(msg);
    if (msg.toLowerCase().contains('not found')) return Failure.notFound(msg);
    return Failure.unexpected(msg.isEmpty ? null : msg);
  }
}
