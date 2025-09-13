import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/address.dart';
import '../entities/user.dart';
import '../repositories/address_repository.dart';

class SaveAddress {
  final AddressRepository _repo;
  SaveAddress(this._repo);
  Future<Either<Failure, Unit>> call(User user, Address address) =>
      _repo.saveAddressForUser(user, address);
}
