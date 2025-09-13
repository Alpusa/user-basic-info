import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SaveUser {
  final UserRepository _repo;
  SaveUser(this._repo);

  Future<Either<Failure, Unit>> call(User user) => _repo.saveUser(user);
}
