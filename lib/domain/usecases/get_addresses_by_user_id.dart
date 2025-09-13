import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

class GetAddressesByUserId {
  final AddressRepository _repo;
  GetAddressesByUserId(this._repo);
  Future<Either<Failure, List<Address>>> call(String userId) =>
      _repo.getAddressesByUserId(userId);
}
