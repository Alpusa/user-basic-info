import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository _repo;
  GetAllUsers(this._repo);
  Future<Either<Failure, List<User>>> call() => _repo.getAllUsers();
}
