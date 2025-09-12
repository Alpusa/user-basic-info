import 'package:get_it/get_it.dart';

import 'domain/repositories/user_repository.dart';
import 'domain/usecases/save_user.dart';
import 'data/repositories/user_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Domain
  sl.registerFactory(() => SaveUser(sl()));

  // Data
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(),
  );
}
