import '../entities/user.dart';

abstract class UserRepository {
  Future<void> saveUser(User user);
}
