// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String get pais => throw _privateConstructorUsedError;
  @HiveField(3)
  String get departamento => throw _privateConstructorUsedError;
  @HiveField(4)
  String get municipio => throw _privateConstructorUsedError;
  @HiveField(5)
  String get direccion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String pais,
      @HiveField(3) String departamento,
      @HiveField(4) String municipio,
      @HiveField(5) String direccion});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? pais = null,
    Object? departamento = null,
    Object? municipio = null,
    Object? direccion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pais: null == pais
          ? _value.pais
          : pais // ignore: cast_nullable_to_non_nullable
              as String,
      departamento: null == departamento
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: null == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
          _$AddressModelImpl value, $Res Function(_$AddressModelImpl) then) =
      __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String userId,
      @HiveField(2) String pais,
      @HiveField(3) String departamento,
      @HiveField(4) String municipio,
      @HiveField(5) String direccion});
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
      _$AddressModelImpl _value, $Res Function(_$AddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? pais = null,
    Object? departamento = null,
    Object? municipio = null,
    Object? direccion = null,
  }) {
    return _then(_$AddressModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pais: null == pais
          ? _value.pais
          : pais // ignore: cast_nullable_to_non_nullable
              as String,
      departamento: null == departamento
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: null == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userId,
      @HiveField(2) required this.pais,
      @HiveField(3) required this.departamento,
      @HiveField(4) required this.municipio,
      @HiveField(5) required this.direccion});

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String userId;
  @override
  @HiveField(2)
  final String pais;
  @override
  @HiveField(3)
  final String departamento;
  @override
  @HiveField(4)
  final String municipio;
  @override
  @HiveField(5)
  final String direccion;

  @override
  String toString() {
    return 'AddressModel(id: $id, userId: $userId, pais: $pais, departamento: $departamento, municipio: $municipio, direccion: $direccion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pais, pais) || other.pais == pais) &&
            (identical(other.departamento, departamento) ||
                other.departamento == departamento) &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio) &&
            (identical(other.direccion, direccion) ||
                other.direccion == direccion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, pais, departamento, municipio, direccion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String userId,
      @HiveField(2) required final String pais,
      @HiveField(3) required final String departamento,
      @HiveField(4) required final String municipio,
      @HiveField(5) required final String direccion}) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get userId;
  @override
  @HiveField(2)
  String get pais;
  @override
  @HiveField(3)
  String get departamento;
  @override
  @HiveField(4)
  String get municipio;
  @override
  @HiveField(5)
  String get direccion;
  @override
  @JsonKey(ignore: true)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
