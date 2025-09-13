import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../repositories/user_repository.dart';

class DeleteUser {
  final UserRepository _repo;
  DeleteUser(this._repo);
  Future<Either<Failure, Unit>> call(String id) => _repo.deleteUser(id);
}
