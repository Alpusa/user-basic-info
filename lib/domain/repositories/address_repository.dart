import 'package:fpdart/fpdart.dart';
import '../../core/errors/failure.dart';
import '../entities/address.dart';
import '../entities/user.dart';

abstract class AddressRepository {
  Future<Either<Failure, Unit>> saveAddressForUser(User user, Address address);

  Future<Either<Failure, Address?>> getAddressById(String id);
  Future<Either<Failure, List<Address>>> getAllAddresses();
  Future<Either<Failure, List<Address>>> getAddressesByUserId(String userId);
  Future<Either<Failure, List<Address>>> searchAddresses({
    String? userId,
    String? pais,
    String? departamento,
    String? municipio,
    String? containsText,
  });

  Future<Either<Failure, Unit>> updateAddress(String id, Address address);
  Future<Either<Failure, Unit>> deleteAddress(String id);
  Future<Either<Failure, Unit>> deleteAddressesByUserId(String userId);
}
