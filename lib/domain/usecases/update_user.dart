import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UpdateUser {
  final UserRepository _repo;
  UpdateUser(this._repo);
  Future<Either<Failure, Unit>> call(User user) => _repo.updateUser(user);
}
