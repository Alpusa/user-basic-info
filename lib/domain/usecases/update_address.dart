import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

class UpdateAddress {
  final AddressRepository _repo;
  UpdateAddress(this._repo);
  Future<Either<Failure, Unit>> call(String id, Address address) =>
      _repo.updateAddress(id, address);
}
