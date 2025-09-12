import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<void> saveUser(User user) async {
    // TODO: Implement persistence (local/remote). For now, no-op.
    return;
  }
}
