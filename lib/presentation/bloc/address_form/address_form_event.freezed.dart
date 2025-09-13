// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? addressId, String? userId) initialized,
    required TResult Function(String pais) paisChanged,
    required TResult Function(String departamento) departamentoChanged,
    required TResult Function(String municipio) municipioChanged,
    required TResult Function(String direccion) direccionChanged,
    required TResult Function(String? pais, String? departamento,
            String? municipio, String? direccion)
        submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? addressId, String? userId)? initialized,
    TResult? Function(String pais)? paisChanged,
    TResult? Function(String departamento)? departamentoChanged,
    TResult? Function(String municipio)? municipioChanged,
    TResult? Function(String direccion)? direccionChanged,
    TResult? Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? addressId, String? userId)? initialized,
    TResult Function(String pais)? paisChanged,
    TResult Function(String departamento)? departamentoChanged,
    TResult Function(String municipio)? municipioChanged,
    TResult Function(String direccion)? direccionChanged,
    TResult Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_PaisChanged value) paisChanged,
    required TResult Function(_DepartamentoChanged value) departamentoChanged,
    required TResult Function(_MunicipioChanged value) municipioChanged,
    required TResult Function(_DireccionChanged value) direccionChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_PaisChanged value)? paisChanged,
    TResult? Function(_DepartamentoChanged value)? departamentoChanged,
    TResult? Function(_MunicipioChanged value)? municipioChanged,
    TResult? Function(_DireccionChanged value)? direccionChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_PaisChanged value)? paisChanged,
    TResult Function(_DepartamentoChanged value)? departamentoChanged,
    TResult Function(_MunicipioChanged value)? municipioChanged,
    TResult Function(_DireccionChanged value)? direccionChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressFormEventCopyWith<$Res> {
  factory $AddressFormEventCopyWith(
          AddressFormEvent value, $Res Function(AddressFormEvent) then) =
      _$AddressFormEventCopyWithImpl<$Res, AddressFormEvent>;
}

/// @nodoc
class _$AddressFormEventCopyWithImpl<$Res, $Val extends AddressFormEvent>
    implements $AddressFormEventCopyWith<$Res> {
  _$AddressFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? addressId, String? userId});
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$InitializedImpl(
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl({this.addressId, this.userId});

  @override
  final String? addressId;
  @override
  final String? userId;

  @override
  String toString() {
    return 'AddressFormEvent.initialized(addressId: $addressId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? addressId, String? userId) initialized,
    required TResult Function(String pais) paisChanged,
    required TResult Function(String departamento) departamentoChanged,
    required TResult Function(String municipio) municipioChanged,
    required TResult Function(String direccion) direccionChanged,
    required TResult Function(String? pais, String? departamento,
            String? municipio, String? direccion)
        submitPressed,
  }) {
    return initialized(addressId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? addressId, String? userId)? initialized,
    TResult? Function(String pais)? paisChanged,
    TResult? Function(String departamento)? departamentoChanged,
    TResult? Function(String municipio)? municipioChanged,
    TResult? Function(String direccion)? direccionChanged,
    TResult? Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
  }) {
    return initialized?.call(addressId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? addressId, String? userId)? initialized,
    TResult Function(String pais)? paisChanged,
    TResult Function(String departamento)? departamentoChanged,
    TResult Function(String municipio)? municipioChanged,
    TResult Function(String direccion)? direccionChanged,
    TResult Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(addressId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_PaisChanged value) paisChanged,
    required TResult Function(_DepartamentoChanged value) departamentoChanged,
    required TResult Function(_MunicipioChanged value) municipioChanged,
    required TResult Function(_DireccionChanged value) direccionChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_PaisChanged value)? paisChanged,
    TResult? Function(_DepartamentoChanged value)? departamentoChanged,
    TResult? Function(_MunicipioChanged value)? municipioChanged,
    TResult? Function(_DireccionChanged value)? direccionChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_PaisChanged value)? paisChanged,
    TResult Function(_DepartamentoChanged value)? departamentoChanged,
    TResult Function(_MunicipioChanged value)? municipioChanged,
    TResult Function(_DireccionChanged value)? direccionChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements AddressFormEvent {
  const factory _Initialized({final String? addressId, final String? userId}) =
      _$InitializedImpl;

  String? get addressId;
  String? get userId;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaisChangedImplCopyWith<$Res> {
  factory _$$PaisChangedImplCopyWith(
          _$PaisChangedImpl value, $Res Function(_$PaisChangedImpl) then) =
      __$$PaisChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pais});
}

/// @nodoc
class __$$PaisChangedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$PaisChangedImpl>
    implements _$$PaisChangedImplCopyWith<$Res> {
  __$$PaisChangedImplCopyWithImpl(
      _$PaisChangedImpl _value, $Res Function(_$PaisChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pais = null,
  }) {
    return _then(_$PaisChangedImpl(
      null == pais
          ? _value.pais
          : pais // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaisChangedImpl implements _PaisChanged {
  const _$PaisChangedImpl(this.pais);

  @override
  final String pais;

  @override
  String toString() {
    return 'AddressFormEvent.paisChanged(pais: $pais)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaisChangedImpl &&
            (identical(other.pais, pais) || other.pais == pais));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pais);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaisChangedImplCopyWith<_$PaisChangedImpl> get copyWith =>
      __$$PaisChangedImplCopyWithImpl<_$PaisChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? addressId, String? userId) initialized,
    required TResult Function(String pais) paisChanged,
    required TResult Function(String departamento) departamentoChanged,
    required TResult Function(String municipio) municipioChanged,
    required TResult Function(String direccion) direccionChanged,
    required TResult Function(String? pais, String? departamento,
            String? municipio, String? direccion)
        submitPressed,
  }) {
    return paisChanged(pais);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? addressId, String? userId)? initialized,
    TResult? Function(String pais)? paisChanged,
    TResult? Function(String departamento)? departamentoChanged,
    TResult? Function(String municipio)? municipioChanged,
    TResult? Function(String direccion)? direccionChanged,
    TResult? Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
  }) {
    return paisChanged?.call(pais);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? addressId, String? userId)? initialized,
    TResult Function(String pais)? paisChanged,
    TResult Function(String departamento)? departamentoChanged,
    TResult Function(String municipio)? municipioChanged,
    TResult Function(String direccion)? direccionChanged,
    TResult Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (paisChanged != null) {
      return paisChanged(pais);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_PaisChanged value) paisChanged,
    required TResult Function(_DepartamentoChanged value) departamentoChanged,
    required TResult Function(_MunicipioChanged value) municipioChanged,
    required TResult Function(_DireccionChanged value) direccionChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return paisChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_PaisChanged value)? paisChanged,
    TResult? Function(_DepartamentoChanged value)? departamentoChanged,
    TResult? Function(_MunicipioChanged value)? municipioChanged,
    TResult? Function(_DireccionChanged value)? direccionChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return paisChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_PaisChanged value)? paisChanged,
    TResult Function(_DepartamentoChanged value)? departamentoChanged,
    TResult Function(_MunicipioChanged value)? municipioChanged,
    TResult Function(_DireccionChanged value)? direccionChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (paisChanged != null) {
      return paisChanged(this);
    }
    return orElse();
  }
}

abstract class _PaisChanged implements AddressFormEvent {
  const factory _PaisChanged(final String pais) = _$PaisChangedImpl;

  String get pais;
  @JsonKey(ignore: true)
  _$$PaisChangedImplCopyWith<_$PaisChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DepartamentoChangedImplCopyWith<$Res> {
  factory _$$DepartamentoChangedImplCopyWith(_$DepartamentoChangedImpl value,
          $Res Function(_$DepartamentoChangedImpl) then) =
      __$$DepartamentoChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String departamento});
}

/// @nodoc
class __$$DepartamentoChangedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$DepartamentoChangedImpl>
    implements _$$DepartamentoChangedImplCopyWith<$Res> {
  __$$DepartamentoChangedImplCopyWithImpl(_$DepartamentoChangedImpl _value,
      $Res Function(_$DepartamentoChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departamento = null,
  }) {
    return _then(_$DepartamentoChangedImpl(
      null == departamento
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DepartamentoChangedImpl implements _DepartamentoChanged {
  const _$DepartamentoChangedImpl(this.departamento);

  @override
  final String departamento;

  @override
  String toString() {
    return 'AddressFormEvent.departamentoChanged(departamento: $departamento)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartamentoChangedImpl &&
            (identical(other.departamento, departamento) ||
                other.departamento == departamento));
  }

  @override
  int get hashCode => Object.hash(runtimeType, departamento);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartamentoChangedImplCopyWith<_$DepartamentoChangedImpl> get copyWith =>
      __$$DepartamentoChangedImplCopyWithImpl<_$DepartamentoChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? addressId, String? userId) initialized,
    required TResult Function(String pais) paisChanged,
    required TResult Function(String departamento) departamentoChanged,
    required TResult Function(String municipio) municipioChanged,
    required TResult Function(String direccion) direccionChanged,
    required TResult Function(String? pais, String? departamento,
            String? municipio, String? direccion)
        submitPressed,
  }) {
    return departamentoChanged(departamento);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? addressId, String? userId)? initialized,
    TResult? Function(String pais)? paisChanged,
    TResult? Function(String departamento)? departamentoChanged,
    TResult? Function(String municipio)? municipioChanged,
    TResult? Function(String direccion)? direccionChanged,
    TResult? Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
  }) {
    return departamentoChanged?.call(departamento);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? addressId, String? userId)? initialized,
    TResult Function(String pais)? paisChanged,
    TResult Function(String departamento)? departamentoChanged,
    TResult Function(String municipio)? municipioChanged,
    TResult Function(String direccion)? direccionChanged,
    TResult Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (departamentoChanged != null) {
      return departamentoChanged(departamento);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_PaisChanged value) paisChanged,
    required TResult Function(_DepartamentoChanged value) departamentoChanged,
    required TResult Function(_MunicipioChanged value) municipioChanged,
    required TResult Function(_DireccionChanged value) direccionChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return departamentoChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_PaisChanged value)? paisChanged,
    TResult? Function(_DepartamentoChanged value)? departamentoChanged,
    TResult? Function(_MunicipioChanged value)? municipioChanged,
    TResult? Function(_DireccionChanged value)? direccionChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return departamentoChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_PaisChanged value)? paisChanged,
    TResult Function(_DepartamentoChanged value)? departamentoChanged,
    TResult Function(_MunicipioChanged value)? municipioChanged,
    TResult Function(_DireccionChanged value)? direccionChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (departamentoChanged != null) {
      return departamentoChanged(this);
    }
    return orElse();
  }
}

abstract class _DepartamentoChanged implements AddressFormEvent {
  const factory _DepartamentoChanged(final String departamento) =
      _$DepartamentoChangedImpl;

  String get departamento;
  @JsonKey(ignore: true)
  _$$DepartamentoChangedImplCopyWith<_$DepartamentoChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MunicipioChangedImplCopyWith<$Res> {
  factory _$$MunicipioChangedImplCopyWith(_$MunicipioChangedImpl value,
          $Res Function(_$MunicipioChangedImpl) then) =
      __$$MunicipioChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String municipio});
}

/// @nodoc
class __$$MunicipioChangedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$MunicipioChangedImpl>
    implements _$$MunicipioChangedImplCopyWith<$Res> {
  __$$MunicipioChangedImplCopyWithImpl(_$MunicipioChangedImpl _value,
      $Res Function(_$MunicipioChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipio = null,
  }) {
    return _then(_$MunicipioChangedImpl(
      null == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MunicipioChangedImpl implements _MunicipioChanged {
  const _$MunicipioChangedImpl(this.municipio);

  @override
  final String municipio;

  @override
  String toString() {
    return 'AddressFormEvent.municipioChanged(municipio: $municipio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MunicipioChangedImpl &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, municipio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MunicipioChangedImplCopyWith<_$MunicipioChangedImpl> get copyWith =>
      __$$MunicipioChangedImplCopyWithImpl<_$MunicipioChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? addressId, String? userId) initialized,
    required TResult Function(String pais) paisChanged,
    required TResult Function(String departamento) departamentoChanged,
    required TResult Function(String municipio) municipioChanged,
    required TResult Function(String direccion) direccionChanged,
    required TResult Function(String? pais, String? departamento,
            String? municipio, String? direccion)
        submitPressed,
  }) {
    return municipioChanged(municipio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? addressId, String? userId)? initialized,
    TResult? Function(String pais)? paisChanged,
    TResult? Function(String departamento)? departamentoChanged,
    TResult? Function(String municipio)? municipioChanged,
    TResult? Function(String direccion)? direccionChanged,
    TResult? Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
  }) {
    return municipioChanged?.call(municipio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? addressId, String? userId)? initialized,
    TResult Function(String pais)? paisChanged,
    TResult Function(String departamento)? departamentoChanged,
    TResult Function(String municipio)? municipioChanged,
    TResult Function(String direccion)? direccionChanged,
    TResult Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (municipioChanged != null) {
      return municipioChanged(municipio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_PaisChanged value) paisChanged,
    required TResult Function(_DepartamentoChanged value) departamentoChanged,
    required TResult Function(_MunicipioChanged value) municipioChanged,
    required TResult Function(_DireccionChanged value) direccionChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return municipioChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_PaisChanged value)? paisChanged,
    TResult? Function(_DepartamentoChanged value)? departamentoChanged,
    TResult? Function(_MunicipioChanged value)? municipioChanged,
    TResult? Function(_DireccionChanged value)? direccionChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return municipioChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_PaisChanged value)? paisChanged,
    TResult Function(_DepartamentoChanged value)? departamentoChanged,
    TResult Function(_MunicipioChanged value)? municipioChanged,
    TResult Function(_DireccionChanged value)? direccionChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (municipioChanged != null) {
      return municipioChanged(this);
    }
    return orElse();
  }
}

abstract class _MunicipioChanged implements AddressFormEvent {
  const factory _MunicipioChanged(final String municipio) =
      _$MunicipioChangedImpl;

  String get municipio;
  @JsonKey(ignore: true)
  _$$MunicipioChangedImplCopyWith<_$MunicipioChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DireccionChangedImplCopyWith<$Res> {
  factory _$$DireccionChangedImplCopyWith(_$DireccionChangedImpl value,
          $Res Function(_$DireccionChangedImpl) then) =
      __$$DireccionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String direccion});
}

/// @nodoc
class __$$DireccionChangedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$DireccionChangedImpl>
    implements _$$DireccionChangedImplCopyWith<$Res> {
  __$$DireccionChangedImplCopyWithImpl(_$DireccionChangedImpl _value,
      $Res Function(_$DireccionChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direccion = null,
  }) {
    return _then(_$DireccionChangedImpl(
      null == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DireccionChangedImpl implements _DireccionChanged {
  const _$DireccionChangedImpl(this.direccion);

  @override
  final String direccion;

  @override
  String toString() {
    return 'AddressFormEvent.direccionChanged(direccion: $direccion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DireccionChangedImpl &&
            (identical(other.direccion, direccion) ||
                other.direccion == direccion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, direccion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DireccionChangedImplCopyWith<_$DireccionChangedImpl> get copyWith =>
      __$$DireccionChangedImplCopyWithImpl<_$DireccionChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? addressId, String? userId) initialized,
    required TResult Function(String pais) paisChanged,
    required TResult Function(String departamento) departamentoChanged,
    required TResult Function(String municipio) municipioChanged,
    required TResult Function(String direccion) direccionChanged,
    required TResult Function(String? pais, String? departamento,
            String? municipio, String? direccion)
        submitPressed,
  }) {
    return direccionChanged(direccion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? addressId, String? userId)? initialized,
    TResult? Function(String pais)? paisChanged,
    TResult? Function(String departamento)? departamentoChanged,
    TResult? Function(String municipio)? municipioChanged,
    TResult? Function(String direccion)? direccionChanged,
    TResult? Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
  }) {
    return direccionChanged?.call(direccion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? addressId, String? userId)? initialized,
    TResult Function(String pais)? paisChanged,
    TResult Function(String departamento)? departamentoChanged,
    TResult Function(String municipio)? municipioChanged,
    TResult Function(String direccion)? direccionChanged,
    TResult Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (direccionChanged != null) {
      return direccionChanged(direccion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_PaisChanged value) paisChanged,
    required TResult Function(_DepartamentoChanged value) departamentoChanged,
    required TResult Function(_MunicipioChanged value) municipioChanged,
    required TResult Function(_DireccionChanged value) direccionChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return direccionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_PaisChanged value)? paisChanged,
    TResult? Function(_DepartamentoChanged value)? departamentoChanged,
    TResult? Function(_MunicipioChanged value)? municipioChanged,
    TResult? Function(_DireccionChanged value)? direccionChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return direccionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_PaisChanged value)? paisChanged,
    TResult Function(_DepartamentoChanged value)? departamentoChanged,
    TResult Function(_MunicipioChanged value)? municipioChanged,
    TResult Function(_DireccionChanged value)? direccionChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (direccionChanged != null) {
      return direccionChanged(this);
    }
    return orElse();
  }
}

abstract class _DireccionChanged implements AddressFormEvent {
  const factory _DireccionChanged(final String direccion) =
      _$DireccionChangedImpl;

  String get direccion;
  @JsonKey(ignore: true)
  _$$DireccionChangedImplCopyWith<_$DireccionChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitPressedImplCopyWith<$Res> {
  factory _$$SubmitPressedImplCopyWith(
          _$SubmitPressedImpl value, $Res Function(_$SubmitPressedImpl) then) =
      __$$SubmitPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? pais,
      String? departamento,
      String? municipio,
      String? direccion});
}

/// @nodoc
class __$$SubmitPressedImplCopyWithImpl<$Res>
    extends _$AddressFormEventCopyWithImpl<$Res, _$SubmitPressedImpl>
    implements _$$SubmitPressedImplCopyWith<$Res> {
  __$$SubmitPressedImplCopyWithImpl(
      _$SubmitPressedImpl _value, $Res Function(_$SubmitPressedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pais = freezed,
    Object? departamento = freezed,
    Object? municipio = freezed,
    Object? direccion = freezed,
  }) {
    return _then(_$SubmitPressedImpl(
      pais: freezed == pais
          ? _value.pais
          : pais // ignore: cast_nullable_to_non_nullable
              as String?,
      departamento: freezed == departamento
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String?,
      municipio: freezed == municipio
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String?,
      direccion: freezed == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubmitPressedImpl implements _SubmitPressed {
  const _$SubmitPressedImpl(
      {this.pais, this.departamento, this.municipio, this.direccion});

  @override
  final String? pais;
  @override
  final String? departamento;
  @override
  final String? municipio;
  @override
  final String? direccion;

  @override
  String toString() {
    return 'AddressFormEvent.submitPressed(pais: $pais, departamento: $departamento, municipio: $municipio, direccion: $direccion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitPressedImpl &&
            (identical(other.pais, pais) || other.pais == pais) &&
            (identical(other.departamento, departamento) ||
                other.departamento == departamento) &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio) &&
            (identical(other.direccion, direccion) ||
                other.direccion == direccion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pais, departamento, municipio, direccion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitPressedImplCopyWith<_$SubmitPressedImpl> get copyWith =>
      __$$SubmitPressedImplCopyWithImpl<_$SubmitPressedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? addressId, String? userId) initialized,
    required TResult Function(String pais) paisChanged,
    required TResult Function(String departamento) departamentoChanged,
    required TResult Function(String municipio) municipioChanged,
    required TResult Function(String direccion) direccionChanged,
    required TResult Function(String? pais, String? departamento,
            String? municipio, String? direccion)
        submitPressed,
  }) {
    return submitPressed(pais, departamento, municipio, direccion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? addressId, String? userId)? initialized,
    TResult? Function(String pais)? paisChanged,
    TResult? Function(String departamento)? departamentoChanged,
    TResult? Function(String municipio)? municipioChanged,
    TResult? Function(String direccion)? direccionChanged,
    TResult? Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
  }) {
    return submitPressed?.call(pais, departamento, municipio, direccion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? addressId, String? userId)? initialized,
    TResult Function(String pais)? paisChanged,
    TResult Function(String departamento)? departamentoChanged,
    TResult Function(String municipio)? municipioChanged,
    TResult Function(String direccion)? direccionChanged,
    TResult Function(String? pais, String? departamento, String? municipio,
            String? direccion)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed(pais, departamento, municipio, direccion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_PaisChanged value) paisChanged,
    required TResult Function(_DepartamentoChanged value) departamentoChanged,
    required TResult Function(_MunicipioChanged value) municipioChanged,
    required TResult Function(_DireccionChanged value) direccionChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return submitPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_PaisChanged value)? paisChanged,
    TResult? Function(_DepartamentoChanged value)? departamentoChanged,
    TResult? Function(_MunicipioChanged value)? municipioChanged,
    TResult? Function(_DireccionChanged value)? direccionChanged,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return submitPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_PaisChanged value)? paisChanged,
    TResult Function(_DepartamentoChanged value)? departamentoChanged,
    TResult Function(_MunicipioChanged value)? municipioChanged,
    TResult Function(_DireccionChanged value)? direccionChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed(this);
    }
    return orElse();
  }
}

abstract class _SubmitPressed implements AddressFormEvent {
  const factory _SubmitPressed(
      {final String? pais,
      final String? departamento,
      final String? municipio,
      final String? direccion}) = _$SubmitPressedImpl;

  String? get pais;
  String? get departamento;
  String? get municipio;
  String? get direccion;
  @JsonKey(ignore: true)
  _$$SubmitPressedImplCopyWith<_$SubmitPressedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
