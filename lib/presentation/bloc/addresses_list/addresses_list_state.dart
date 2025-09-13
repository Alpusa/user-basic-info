import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/errors/failure.dart';
import '../../../domain/entities/address.dart';

part 'addresses_list_state.freezed.dart';

@freezed
class AddressesListState with _$AddressesListState {
  const factory AddressesListState.initial() = _Initial;
  const factory AddressesListState.loading() = _Loading;
  const factory AddressesListState.success(List<Address> items) = _Success;
  const factory AddressesListState.failure(Failure failure) = _Failure;
}
