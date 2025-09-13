import 'package:fpdart/fpdart.dart';
import '../../core/errors/failure.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

class GetAddressById {
  final AddressRepository _repo;
  GetAddressById(this._repo);
  Future<Either<Failure, Address?>> call(String id) => _repo.getAddressById(id);
}
