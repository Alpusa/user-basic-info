// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() deleteAllUsersRequested,
    required TResult Function() deleteAllAddressesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? deleteAllUsersRequested,
    TResult? Function()? deleteAllAddressesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? deleteAllUsersRequested,
    TResult Function()? deleteAllAddressesRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(DeleteAllUsersRequested value)
        deleteAllUsersRequested,
    required TResult Function(DeleteAllAddressesRequested value)
        deleteAllAddressesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult? Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadRequestedImplCopyWith<$Res> {
  factory _$$LoadRequestedImplCopyWith(
          _$LoadRequestedImpl value, $Res Function(_$LoadRequestedImpl) then) =
      __$$LoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadRequestedImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$LoadRequestedImpl>
    implements _$$LoadRequestedImplCopyWith<$Res> {
  __$$LoadRequestedImplCopyWithImpl(
      _$LoadRequestedImpl _value, $Res Function(_$LoadRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadRequestedImpl implements LoadRequested {
  const _$LoadRequestedImpl();

  @override
  String toString() {
    return 'SettingsEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() deleteAllUsersRequested,
    required TResult Function() deleteAllAddressesRequested,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? deleteAllUsersRequested,
    TResult? Function()? deleteAllAddressesRequested,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? deleteAllUsersRequested,
    TResult Function()? deleteAllAddressesRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(DeleteAllUsersRequested value)
        deleteAllUsersRequested,
    required TResult Function(DeleteAllAddressesRequested value)
        deleteAllAddressesRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult? Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class LoadRequested implements SettingsEvent {
  const factory LoadRequested() = _$LoadRequestedImpl;
}

/// @nodoc
abstract class _$$DeleteAllUsersRequestedImplCopyWith<$Res> {
  factory _$$DeleteAllUsersRequestedImplCopyWith(
          _$DeleteAllUsersRequestedImpl value,
          $Res Function(_$DeleteAllUsersRequestedImpl) then) =
      __$$DeleteAllUsersRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAllUsersRequestedImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$DeleteAllUsersRequestedImpl>
    implements _$$DeleteAllUsersRequestedImplCopyWith<$Res> {
  __$$DeleteAllUsersRequestedImplCopyWithImpl(
      _$DeleteAllUsersRequestedImpl _value,
      $Res Function(_$DeleteAllUsersRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteAllUsersRequestedImpl implements DeleteAllUsersRequested {
  const _$DeleteAllUsersRequestedImpl();

  @override
  String toString() {
    return 'SettingsEvent.deleteAllUsersRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAllUsersRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() deleteAllUsersRequested,
    required TResult Function() deleteAllAddressesRequested,
  }) {
    return deleteAllUsersRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? deleteAllUsersRequested,
    TResult? Function()? deleteAllAddressesRequested,
  }) {
    return deleteAllUsersRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? deleteAllUsersRequested,
    TResult Function()? deleteAllAddressesRequested,
    required TResult orElse(),
  }) {
    if (deleteAllUsersRequested != null) {
      return deleteAllUsersRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(DeleteAllUsersRequested value)
        deleteAllUsersRequested,
    required TResult Function(DeleteAllAddressesRequested value)
        deleteAllAddressesRequested,
  }) {
    return deleteAllUsersRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult? Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
  }) {
    return deleteAllUsersRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
    required TResult orElse(),
  }) {
    if (deleteAllUsersRequested != null) {
      return deleteAllUsersRequested(this);
    }
    return orElse();
  }
}

abstract class DeleteAllUsersRequested implements SettingsEvent {
  const factory DeleteAllUsersRequested() = _$DeleteAllUsersRequestedImpl;
}

/// @nodoc
abstract class _$$DeleteAllAddressesRequestedImplCopyWith<$Res> {
  factory _$$DeleteAllAddressesRequestedImplCopyWith(
          _$DeleteAllAddressesRequestedImpl value,
          $Res Function(_$DeleteAllAddressesRequestedImpl) then) =
      __$$DeleteAllAddressesRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAllAddressesRequestedImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$DeleteAllAddressesRequestedImpl>
    implements _$$DeleteAllAddressesRequestedImplCopyWith<$Res> {
  __$$DeleteAllAddressesRequestedImplCopyWithImpl(
      _$DeleteAllAddressesRequestedImpl _value,
      $Res Function(_$DeleteAllAddressesRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteAllAddressesRequestedImpl implements DeleteAllAddressesRequested {
  const _$DeleteAllAddressesRequestedImpl();

  @override
  String toString() {
    return 'SettingsEvent.deleteAllAddressesRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAllAddressesRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() deleteAllUsersRequested,
    required TResult Function() deleteAllAddressesRequested,
  }) {
    return deleteAllAddressesRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? deleteAllUsersRequested,
    TResult? Function()? deleteAllAddressesRequested,
  }) {
    return deleteAllAddressesRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? deleteAllUsersRequested,
    TResult Function()? deleteAllAddressesRequested,
    required TResult orElse(),
  }) {
    if (deleteAllAddressesRequested != null) {
      return deleteAllAddressesRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(DeleteAllUsersRequested value)
        deleteAllUsersRequested,
    required TResult Function(DeleteAllAddressesRequested value)
        deleteAllAddressesRequested,
  }) {
    return deleteAllAddressesRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult? Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
  }) {
    return deleteAllAddressesRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(DeleteAllUsersRequested value)? deleteAllUsersRequested,
    TResult Function(DeleteAllAddressesRequested value)?
        deleteAllAddressesRequested,
    required TResult orElse(),
  }) {
    if (deleteAllAddressesRequested != null) {
      return deleteAllAddressesRequested(this);
    }
    return orElse();
  }
}

abstract class DeleteAllAddressesRequested implements SettingsEvent {
  const factory DeleteAllAddressesRequested() =
      _$DeleteAllAddressesRequestedImpl;
}
