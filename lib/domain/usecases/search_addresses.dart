import 'package:fpdart/fpdart.dart';

import '../../core/errors/failure.dart';
import '../entities/address.dart';
import '../repositories/address_repository.dart';

class SearchAddresses {
  final AddressRepository _repo;
  SearchAddresses(this._repo);
  Future<Either<Failure, List<Address>>> call({
    String? userId,
    String? pais,
    String? departamento,
    String? municipio,
    String? containsText,
  }) => _repo.searchAddresses(
    userId: userId,
    pais: pais,
    departamento: departamento,
    municipio: municipio,
    containsText: containsText,
  );
}
