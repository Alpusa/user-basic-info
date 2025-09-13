import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

class GetAllAddresses {
  final AddressRepository _repo;
  GetAllAddresses(this._repo);
  Future<Either<Failure, List<Address>>> call() => _repo.getAllAddresses();
}
