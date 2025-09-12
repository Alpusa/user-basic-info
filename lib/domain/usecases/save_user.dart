import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SaveUser {
  final UserRepository _repo;
  SaveUser(this._repo);

  Future<void> call(User user) => _repo.saveUser(user);
}
