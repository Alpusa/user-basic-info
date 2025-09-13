// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? userId) initialized,
    required TResult Function(
            String? nombre, String? apellido, String? fechaNacimiento)
        submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? userId)? initialized,
    TResult? Function(
            String? nombre, String? apellido, String? fechaNacimiento)?
        submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? userId)? initialized,
    TResult Function(String? nombre, String? apellido, String? fechaNacimiento)?
        submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFormEventCopyWith<$Res> {
  factory $UserFormEventCopyWith(
          UserFormEvent value, $Res Function(UserFormEvent) then) =
      _$UserFormEventCopyWithImpl<$Res, UserFormEvent>;
}

/// @nodoc
class _$UserFormEventCopyWithImpl<$Res, $Val extends UserFormEvent>
    implements $UserFormEventCopyWith<$Res> {
  _$UserFormEventCopyWithImpl(this._value, this._then);

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
  $Res call({String? userId});
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$UserFormEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_$InitializedImpl(
      freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(this.userId);

  @override
  final String? userId;

  @override
  String toString() {
    return 'UserFormEvent.initialized(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? userId) initialized,
    required TResult Function(
            String? nombre, String? apellido, String? fechaNacimiento)
        submitPressed,
  }) {
    return initialized(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? userId)? initialized,
    TResult? Function(
            String? nombre, String? apellido, String? fechaNacimiento)?
        submitPressed,
  }) {
    return initialized?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? userId)? initialized,
    TResult Function(String? nombre, String? apellido, String? fechaNacimiento)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements UserFormEvent {
  const factory _Initialized(final String? userId) = _$InitializedImpl;

  String? get userId;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitPressedImplCopyWith<$Res> {
  factory _$$SubmitPressedImplCopyWith(
          _$SubmitPressedImpl value, $Res Function(_$SubmitPressedImpl) then) =
      __$$SubmitPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? nombre, String? apellido, String? fechaNacimiento});
}

/// @nodoc
class __$$SubmitPressedImplCopyWithImpl<$Res>
    extends _$UserFormEventCopyWithImpl<$Res, _$SubmitPressedImpl>
    implements _$$SubmitPressedImplCopyWith<$Res> {
  __$$SubmitPressedImplCopyWithImpl(
      _$SubmitPressedImpl _value, $Res Function(_$SubmitPressedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = freezed,
    Object? apellido = freezed,
    Object? fechaNacimiento = freezed,
  }) {
    return _then(_$SubmitPressedImpl(
      nombre: freezed == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String?,
      apellido: freezed == apellido
          ? _value.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String?,
      fechaNacimiento: freezed == fechaNacimiento
          ? _value.fechaNacimiento
          : fechaNacimiento // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubmitPressedImpl implements _SubmitPressed {
  const _$SubmitPressedImpl({this.nombre, this.apellido, this.fechaNacimiento});

  @override
  final String? nombre;
  @override
  final String? apellido;
  @override
  final String? fechaNacimiento;

  @override
  String toString() {
    return 'UserFormEvent.submitPressed(nombre: $nombre, apellido: $apellido, fechaNacimiento: $fechaNacimiento)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitPressedImpl &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.apellido, apellido) ||
                other.apellido == apellido) &&
            (identical(other.fechaNacimiento, fechaNacimiento) ||
                other.fechaNacimiento == fechaNacimiento));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nombre, apellido, fechaNacimiento);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitPressedImplCopyWith<_$SubmitPressedImpl> get copyWith =>
      __$$SubmitPressedImplCopyWithImpl<_$SubmitPressedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? userId) initialized,
    required TResult Function(
            String? nombre, String? apellido, String? fechaNacimiento)
        submitPressed,
  }) {
    return submitPressed(nombre, apellido, fechaNacimiento);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? userId)? initialized,
    TResult? Function(
            String? nombre, String? apellido, String? fechaNacimiento)?
        submitPressed,
  }) {
    return submitPressed?.call(nombre, apellido, fechaNacimiento);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? userId)? initialized,
    TResult Function(String? nombre, String? apellido, String? fechaNacimiento)?
        submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed(nombre, apellido, fechaNacimiento);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return submitPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubmitPressed value)? submitPressed,
  }) {
    return submitPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed(this);
    }
    return orElse();
  }
}

abstract class _SubmitPressed implements UserFormEvent {
  const factory _SubmitPressed(
      {final String? nombre,
      final String? apellido,
      final String? fechaNacimiento}) = _$SubmitPressedImpl;

  String? get nombre;
  String? get apellido;
  String? get fechaNacimiento;
  @JsonKey(ignore: true)
  _$$SubmitPressedImplCopyWith<_$SubmitPressedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
