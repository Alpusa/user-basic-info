import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/errors/failure.dart';

part 'user_form_state.freezed.dart';

@freezed
class UserFormState with _$UserFormState {
  const factory UserFormState({
    @Default(false) bool isEdit,
    @Default(false) bool isSubmitting,
    @Default(false) bool submitted,
    String? id,
    @Default('') String nombre,
    @Default('') String apellido,
    String? fechaText, // DD/MM/AAAA
    DateTime? fechaNacimiento,
    Failure? failure,
    @Default(false) bool isSuccess,
  }) = _UserFormState;

  const UserFormState._();

  bool get isValidNombre => nombre.trim().isNotEmpty;
  bool get isValidApellido => apellido.trim().isNotEmpty;
  bool get isValidFecha => fechaNacimiento != null;
}
