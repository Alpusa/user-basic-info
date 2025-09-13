import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SearchUsers {
  final UserRepository _repo;
  SearchUsers(this._repo);
  Future<Either<Failure, List<User>>> call({
    String? query,
    String? nombre,
    String? apellido,
    DateTime? bornAfter,
    DateTime? bornBefore,
  }) => _repo.searchUsers(
    query: query,
    nombre: nombre,
    apellido: apellido,
    bornAfter: bornAfter,
    bornBefore: bornBefore,
  );
}
