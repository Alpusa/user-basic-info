import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> saveUser(User user);

  Future<Either<Failure, User?>> getUserById(String id);
  Future<Either<Failure, List<User>>> getAllUsers();
  Future<Either<Failure, List<User>>> searchUsers({
    String? query,
    String? nombre,
    String? apellido,
    DateTime? bornAfter,
    DateTime? bornBefore,
  });

  Future<Either<Failure, Unit>> updateUser(User user);
  Future<Either<Failure, Unit>> deleteUser(String id);
}
