import 'package:freezed_annotation/freezed_annotation.dart';

part 'addresses_list_event.freezed.dart';

@freezed
class AddressesListEvent with _$AddressesListEvent {
  const factory AddressesListEvent.loadRequested() = LoadRequested;
  const factory AddressesListEvent.searchRequested({
    String? query,
    String? pais,
    String? departamento,
    String? municipio,
  }) = SearchRequested;
}
