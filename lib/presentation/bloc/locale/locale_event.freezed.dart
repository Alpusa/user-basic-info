// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocaleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String localeCode) setLocaleRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String localeCode)? setLocaleRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String localeCode)? setLocaleRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocaleRequested value) loadRequested,
    required TResult Function(SetLocaleRequested value) setLocaleRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocaleRequested value)? loadRequested,
    TResult? Function(SetLocaleRequested value)? setLocaleRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocaleRequested value)? loadRequested,
    TResult Function(SetLocaleRequested value)? setLocaleRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleEventCopyWith<$Res> {
  factory $LocaleEventCopyWith(
          LocaleEvent value, $Res Function(LocaleEvent) then) =
      _$LocaleEventCopyWithImpl<$Res, LocaleEvent>;
}

/// @nodoc
class _$LocaleEventCopyWithImpl<$Res, $Val extends LocaleEvent>
    implements $LocaleEventCopyWith<$Res> {
  _$LocaleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadLocaleRequestedImplCopyWith<$Res> {
  factory _$$LoadLocaleRequestedImplCopyWith(_$LoadLocaleRequestedImpl value,
          $Res Function(_$LoadLocaleRequestedImpl) then) =
      __$$LoadLocaleRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadLocaleRequestedImplCopyWithImpl<$Res>
    extends _$LocaleEventCopyWithImpl<$Res, _$LoadLocaleRequestedImpl>
    implements _$$LoadLocaleRequestedImplCopyWith<$Res> {
  __$$LoadLocaleRequestedImplCopyWithImpl(_$LoadLocaleRequestedImpl _value,
      $Res Function(_$LoadLocaleRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadLocaleRequestedImpl implements LoadLocaleRequested {
  const _$LoadLocaleRequestedImpl();

  @override
  String toString() {
    return 'LocaleEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadLocaleRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String localeCode) setLocaleRequested,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String localeCode)? setLocaleRequested,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String localeCode)? setLocaleRequested,
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
    required TResult Function(LoadLocaleRequested value) loadRequested,
    required TResult Function(SetLocaleRequested value) setLocaleRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocaleRequested value)? loadRequested,
    TResult? Function(SetLocaleRequested value)? setLocaleRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocaleRequested value)? loadRequested,
    TResult Function(SetLocaleRequested value)? setLocaleRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class LoadLocaleRequested implements LocaleEvent {
  const factory LoadLocaleRequested() = _$LoadLocaleRequestedImpl;
}

/// @nodoc
abstract class _$$SetLocaleRequestedImplCopyWith<$Res> {
  factory _$$SetLocaleRequestedImplCopyWith(_$SetLocaleRequestedImpl value,
          $Res Function(_$SetLocaleRequestedImpl) then) =
      __$$SetLocaleRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String localeCode});
}

/// @nodoc
class __$$SetLocaleRequestedImplCopyWithImpl<$Res>
    extends _$LocaleEventCopyWithImpl<$Res, _$SetLocaleRequestedImpl>
    implements _$$SetLocaleRequestedImplCopyWith<$Res> {
  __$$SetLocaleRequestedImplCopyWithImpl(_$SetLocaleRequestedImpl _value,
      $Res Function(_$SetLocaleRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeCode = null,
  }) {
    return _then(_$SetLocaleRequestedImpl(
      null == localeCode
          ? _value.localeCode
          : localeCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetLocaleRequestedImpl implements SetLocaleRequested {
  const _$SetLocaleRequestedImpl(this.localeCode);

  @override
  final String localeCode;

  @override
  String toString() {
    return 'LocaleEvent.setLocaleRequested(localeCode: $localeCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetLocaleRequestedImpl &&
            (identical(other.localeCode, localeCode) ||
                other.localeCode == localeCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localeCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetLocaleRequestedImplCopyWith<_$SetLocaleRequestedImpl> get copyWith =>
      __$$SetLocaleRequestedImplCopyWithImpl<_$SetLocaleRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String localeCode) setLocaleRequested,
  }) {
    return setLocaleRequested(localeCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String localeCode)? setLocaleRequested,
  }) {
    return setLocaleRequested?.call(localeCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String localeCode)? setLocaleRequested,
    required TResult orElse(),
  }) {
    if (setLocaleRequested != null) {
      return setLocaleRequested(localeCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocaleRequested value) loadRequested,
    required TResult Function(SetLocaleRequested value) setLocaleRequested,
  }) {
    return setLocaleRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocaleRequested value)? loadRequested,
    TResult? Function(SetLocaleRequested value)? setLocaleRequested,
  }) {
    return setLocaleRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocaleRequested value)? loadRequested,
    TResult Function(SetLocaleRequested value)? setLocaleRequested,
    required TResult orElse(),
  }) {
    if (setLocaleRequested != null) {
      return setLocaleRequested(this);
    }
    return orElse();
  }
}

abstract class SetLocaleRequested implements LocaleEvent {
  const factory SetLocaleRequested(final String localeCode) =
      _$SetLocaleRequestedImpl;

  String get localeCode;
  @JsonKey(ignore: true)
  _$$SetLocaleRequestedImplCopyWith<_$SetLocaleRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
