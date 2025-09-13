import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/repositories/address_repository.dart';
import '../models/user/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final Box<UserModel> _usersBox;
  final AddressRepository _addressRepo;

  UserRepositoryImpl(this._usersBox, this._addressRepo);

  @override
  Future<Either<Failure, Unit>> saveUser(User user) async {
    try {
      final id = user.id.isEmpty ? const Uuid().v4() : user.id;
      final model = UserModel(
        id: id,
        nombre: user.nombre,
        apellido: user.apellido,
        fechaNacimiento: user.fechaNacimiento,
      );
      await _usersBox.put(id, model);
      return right(unit);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, User?>> getUserById(String id) async {
    try {
      final model = _usersBox.get(id);
      if (model == null) return right(null);
      return right(
        User(
          id: model.id,
          nombre: model.nombre,
          apellido: model.apellido,
          fechaNacimiento: model.fechaNacimiento,
        ),
      );
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final users = _usersBox.values
          .map(
            (m) => User(
              id: m.id,
              nombre: m.nombre,
              apellido: m.apellido,
              fechaNacimiento: m.fechaNacimiento,
            ),
          )
          .toList(growable: false);
      return right(users);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, List<User>>> searchUsers({
    String? query,
    String? nombre,
    String? apellido,
    DateTime? bornAfter,
    DateTime? bornBefore,
  }) async {
    try {
      Iterable<UserModel> items = _usersBox.values;
      if (query != null && query.trim().isNotEmpty) {
        final q = query.toLowerCase();
        items = items.where(
          (m) =>
              m.nombre.toLowerCase().contains(q) ||
              m.apellido.toLowerCase().contains(q),
        );
      }
      if (nombre != null) {
        final n = nombre.toLowerCase();
        items = items.where((m) => m.nombre.toLowerCase().contains(n));
      }
      if (apellido != null) {
        final a = apellido.toLowerCase();
        items = items.where((m) => m.apellido.toLowerCase().contains(a));
      }
      if (bornAfter != null) {
        items = items.where((m) => m.fechaNacimiento.isAfter(bornAfter));
      }
      if (bornBefore != null) {
        items = items.where((m) => m.fechaNacimiento.isBefore(bornBefore));
      }
      final list = items
          .map(
            (m) => User(
              id: m.id,
              nombre: m.nombre,
              apellido: m.apellido,
              fechaNacimiento: m.fechaNacimiento,
            ),
          )
          .toList(growable: false);
      return right(list);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser(User user) async {
    try {
      final exists = _usersBox.containsKey(user.id);
      if (!exists) {
        // Si no existe, guarda como nuevo
        return saveUser(user);
      }
      final model = UserModel(
        id: user.id,
        nombre: user.nombre,
        apellido: user.apellido,
        fechaNacimiento: user.fechaNacimiento,
      );
      await _usersBox.put(user.id, model);
      return right(unit);
    } catch (e) {
      return left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteUser(String id) async {
    try {
      await _addressRepo.deleteAddressesByUserId(id);
      await _usersBox.delete(id);
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
