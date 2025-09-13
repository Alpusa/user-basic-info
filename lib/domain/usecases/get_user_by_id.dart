import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserById {
  final UserRepository _repo;
  GetUserById(this._repo);
  Future<Either<Failure, User?>> call(String id) => _repo.getUserById(id);
}
