// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @HiveField(0)
  String get nombre => throw _privateConstructorUsedError;
  @HiveField(1)
  String get apellido => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get fechaNacimiento => throw _privateConstructorUsedError;
  @HiveField(3)
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@HiveField(0) String nombre,
      @HiveField(1) String apellido,
      @HiveField(2) DateTime fechaNacimiento,
      @HiveField(3) String id});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = null,
    Object? apellido = null,
    Object? fechaNacimiento = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      apellido: null == apellido
          ? _value.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String,
      fechaNacimiento: null == fechaNacimiento
          ? _value.fechaNacimiento
          : fechaNacimiento // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String nombre,
      @HiveField(1) String apellido,
      @HiveField(2) DateTime fechaNacimiento,
      @HiveField(3) String id});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = null,
    Object? apellido = null,
    Object? fechaNacimiento = null,
    Object? id = null,
  }) {
    return _then(_$UserModelImpl(
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      apellido: null == apellido
          ? _value.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String,
      fechaNacimiento: null == fechaNacimiento
          ? _value.fechaNacimiento
          : fechaNacimiento // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@HiveField(0) required this.nombre,
      @HiveField(1) required this.apellido,
      @HiveField(2) required this.fechaNacimiento,
      @HiveField(3) required this.id});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @HiveField(0)
  final String nombre;
  @override
  @HiveField(1)
  final String apellido;
  @override
  @HiveField(2)
  final DateTime fechaNacimiento;
  @override
  @HiveField(3)
  final String id;

  @override
  String toString() {
    return 'UserModel(nombre: $nombre, apellido: $apellido, fechaNacimiento: $fechaNacimiento, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.apellido, apellido) ||
                other.apellido == apellido) &&
            (identical(other.fechaNacimiento, fechaNacimiento) ||
                other.fechaNacimiento == fechaNacimiento) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nombre, apellido, fechaNacimiento, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@HiveField(0) required final String nombre,
      @HiveField(1) required final String apellido,
      @HiveField(2) required final DateTime fechaNacimiento,
      @HiveField(3) required final String id}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @HiveField(0)
  String get nombre;
  @override
  @HiveField(1)
  String get apellido;
  @override
  @HiveField(2)
  DateTime get fechaNacimiento;
  @override
  @HiveField(3)
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
