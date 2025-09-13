// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserFormState {
  bool get isEdit => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get submitted => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  String get apellido => throw _privateConstructorUsedError;
  String? get fechaText => throw _privateConstructorUsedError; // DD/MM/AAAA
  DateTime? get fechaNacimiento => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFormStateCopyWith<UserFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFormStateCopyWith<$Res> {
  factory $UserFormStateCopyWith(
          UserFormState value, $Res Function(UserFormState) then) =
      _$UserFormStateCopyWithImpl<$Res, UserFormState>;
  @useResult
  $Res call(
      {bool isEdit,
      bool isSubmitting,
      bool submitted,
      String? id,
      String nombre,
      String apellido,
      String? fechaText,
      DateTime? fechaNacimiento,
      Failure? failure,
      bool isSuccess});

  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$UserFormStateCopyWithImpl<$Res, $Val extends UserFormState>
    implements $UserFormStateCopyWith<$Res> {
  _$UserFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEdit = null,
    Object? isSubmitting = null,
    Object? submitted = null,
    Object? id = freezed,
    Object? nombre = null,
    Object? apellido = null,
    Object? fechaText = freezed,
    Object? fechaNacimiento = freezed,
    Object? failure = freezed,
    Object? isSuccess = null,
  }) {
    return _then(_value.copyWith(
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submitted: null == submitted
          ? _value.submitted
          : submitted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      apellido: null == apellido
          ? _value.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String,
      fechaText: freezed == fechaText
          ? _value.fechaText
          : fechaText // ignore: cast_nullable_to_non_nullable
              as String?,
      fechaNacimiento: freezed == fechaNacimiento
          ? _value.fechaNacimiento
          : fechaNacimiento // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserFormStateImplCopyWith<$Res>
    implements $UserFormStateCopyWith<$Res> {
  factory _$$UserFormStateImplCopyWith(
          _$UserFormStateImpl value, $Res Function(_$UserFormStateImpl) then) =
      __$$UserFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEdit,
      bool isSubmitting,
      bool submitted,
      String? id,
      String nombre,
      String apellido,
      String? fechaText,
      DateTime? fechaNacimiento,
      Failure? failure,
      bool isSuccess});

  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$UserFormStateImplCopyWithImpl<$Res>
    extends _$UserFormStateCopyWithImpl<$Res, _$UserFormStateImpl>
    implements _$$UserFormStateImplCopyWith<$Res> {
  __$$UserFormStateImplCopyWithImpl(
      _$UserFormStateImpl _value, $Res Function(_$UserFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEdit = null,
    Object? isSubmitting = null,
    Object? submitted = null,
    Object? id = freezed,
    Object? nombre = null,
    Object? apellido = null,
    Object? fechaText = freezed,
    Object? fechaNacimiento = freezed,
    Object? failure = freezed,
    Object? isSuccess = null,
  }) {
    return _then(_$UserFormStateImpl(
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      submitted: null == submitted
          ? _value.submitted
          : submitted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      apellido: null == apellido
          ? _value.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String,
      fechaText: freezed == fechaText
          ? _value.fechaText
          : fechaText // ignore: cast_nullable_to_non_nullable
              as String?,
      fechaNacimiento: freezed == fechaNacimiento
          ? _value.fechaNacimiento
          : fechaNacimiento // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserFormStateImpl extends _UserFormState {
  const _$UserFormStateImpl(
      {this.isEdit = false,
      this.isSubmitting = false,
      this.submitted = false,
      this.id,
      this.nombre = '',
      this.apellido = '',
      this.fechaText,
      this.fechaNacimiento,
      this.failure,
      this.isSuccess = false})
      : super._();

  @override
  @JsonKey()
  final bool isEdit;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool submitted;
  @override
  final String? id;
  @override
  @JsonKey()
  final String nombre;
  @override
  @JsonKey()
  final String apellido;
  @override
  final String? fechaText;
// DD/MM/AAAA
  @override
  final DateTime? fechaNacimiento;
  @override
  final Failure? failure;
  @override
  @JsonKey()
  final bool isSuccess;

  @override
  String toString() {
    return 'UserFormState(isEdit: $isEdit, isSubmitting: $isSubmitting, submitted: $submitted, id: $id, nombre: $nombre, apellido: $apellido, fechaText: $fechaText, fechaNacimiento: $fechaNacimiento, failure: $failure, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFormStateImpl &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.submitted, submitted) ||
                other.submitted == submitted) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.apellido, apellido) ||
                other.apellido == apellido) &&
            (identical(other.fechaText, fechaText) ||
                other.fechaText == fechaText) &&
            (identical(other.fechaNacimiento, fechaNacimiento) ||
                other.fechaNacimiento == fechaNacimiento) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEdit, isSubmitting, submitted,
      id, nombre, apellido, fechaText, fechaNacimiento, failure, isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFormStateImplCopyWith<_$UserFormStateImpl> get copyWith =>
      __$$UserFormStateImplCopyWithImpl<_$UserFormStateImpl>(this, _$identity);
}

abstract class _UserFormState extends UserFormState {
  const factory _UserFormState(
      {final bool isEdit,
      final bool isSubmitting,
      final bool submitted,
      final String? id,
      final String nombre,
      final String apellido,
      final String? fechaText,
      final DateTime? fechaNacimiento,
      final Failure? failure,
      final bool isSuccess}) = _$UserFormStateImpl;
  const _UserFormState._() : super._();

  @override
  bool get isEdit;
  @override
  bool get isSubmitting;
  @override
  bool get submitted;
  @override
  String? get id;
  @override
  String get nombre;
  @override
  String get apellido;
  @override
  String? get fechaText;
  @override // DD/MM/AAAA
  DateTime? get fechaNacimiento;
  @override
  Failure? get failure;
  @override
  bool get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$UserFormStateImplCopyWith<_$UserFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
