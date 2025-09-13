import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_form_event.freezed.dart';

@freezed
class AddressFormEvent with _$AddressFormEvent {
  const factory AddressFormEvent.initialized({String? addressId, String? userId}) = _Initialized;
  const factory AddressFormEvent.paisChanged(String pais) = _PaisChanged;
  const factory AddressFormEvent.departamentoChanged(String departamento) = _DepartamentoChanged;
  const factory AddressFormEvent.municipioChanged(String municipio) = _MunicipioChanged;
  const factory AddressFormEvent.direccionChanged(String direccion) = _DireccionChanged;
  const factory AddressFormEvent.submitPressed({
    String? pais,
    String? departamento,
    String? municipio,
    String? direccion,
  }) = _SubmitPressed;
}
