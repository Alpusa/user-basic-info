import 'package:fpdart/fpdart.dart';
import '../../core/errors/failure.dart';
import '../repositories/address_repository.dart';

class DeleteAddress {
  final AddressRepository _repo;
  DeleteAddress(this._repo);
  Future<Either<Failure, Unit>> call(String id) => _repo.deleteAddress(id);
}

class DeleteAddressesByUserId {
  final AddressRepository _repo;
  DeleteAddressesByUserId(this._repo);
  Future<Either<Failure, Unit>> call(String userId) =>
      _repo.deleteAddressesByUserId(userId);
}
