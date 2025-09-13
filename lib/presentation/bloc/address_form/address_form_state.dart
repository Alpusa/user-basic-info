import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/errors/failure.dart';

part 'address_form_state.freezed.dart';

@freezed
class AddressFormState with _$AddressFormState {
  const factory AddressFormState({
    @Default(false) bool isEdit,
    @Default(false) bool isSubmitting,
    @Default(false) bool submitted,
    String? id,
    String? userId,
    @Default('') String pais,
    @Default('') String departamento,
    @Default('') String municipio,
    @Default('') String direccion,
    Failure? failure,
    @Default(false) bool isSuccess,
  }) = _AddressFormState;

  const AddressFormState._();

  bool get isValidPais => pais.trim().isNotEmpty;
  bool get isValidDepartamento => departamento.trim().isNotEmpty;
  bool get isValidMunicipio => municipio.trim().isNotEmpty;
  bool get isValidDireccion => direccion.trim().isNotEmpty;
}
