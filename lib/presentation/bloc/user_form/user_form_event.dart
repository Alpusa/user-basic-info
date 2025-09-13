import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_form_event.freezed.dart';

@freezed
class UserFormEvent with _$UserFormEvent {
  const factory UserFormEvent.initialized(String? userId) = _Initialized;
  const factory UserFormEvent.submitPressed({
    String? nombre,
    String? apellido,
    String? fechaNacimiento,
  }) = _SubmitPressed;
}
