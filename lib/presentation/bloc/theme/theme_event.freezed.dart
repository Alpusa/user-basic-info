// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleRequested,
    required TResult Function(String mode) setThemeRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleRequested,
    TResult? Function(String mode)? setThemeRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleRequested,
    TResult Function(String mode)? setThemeRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleRequested value) toggleRequested,
    required TResult Function(_SetThemeRequested value) setThemeRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleRequested value)? toggleRequested,
    TResult? Function(_SetThemeRequested value)? setThemeRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleRequested value)? toggleRequested,
    TResult Function(_SetThemeRequested value)? setThemeRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ToggleRequestedImplCopyWith<$Res> {
  factory _$$ToggleRequestedImplCopyWith(_$ToggleRequestedImpl value,
          $Res Function(_$ToggleRequestedImpl) then) =
      __$$ToggleRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleRequestedImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ToggleRequestedImpl>
    implements _$$ToggleRequestedImplCopyWith<$Res> {
  __$$ToggleRequestedImplCopyWithImpl(
      _$ToggleRequestedImpl _value, $Res Function(_$ToggleRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleRequestedImpl implements _ToggleRequested {
  const _$ToggleRequestedImpl();

  @override
  String toString() {
    return 'ThemeEvent.toggleRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleRequested,
    required TResult Function(String mode) setThemeRequested,
  }) {
    return toggleRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleRequested,
    TResult? Function(String mode)? setThemeRequested,
  }) {
    return toggleRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleRequested,
    TResult Function(String mode)? setThemeRequested,
    required TResult orElse(),
  }) {
    if (toggleRequested != null) {
      return toggleRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleRequested value) toggleRequested,
    required TResult Function(_SetThemeRequested value) setThemeRequested,
  }) {
    return toggleRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleRequested value)? toggleRequested,
    TResult? Function(_SetThemeRequested value)? setThemeRequested,
  }) {
    return toggleRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleRequested value)? toggleRequested,
    TResult Function(_SetThemeRequested value)? setThemeRequested,
    required TResult orElse(),
  }) {
    if (toggleRequested != null) {
      return toggleRequested(this);
    }
    return orElse();
  }
}

abstract class _ToggleRequested implements ThemeEvent {
  const factory _ToggleRequested() = _$ToggleRequestedImpl;
}

/// @nodoc
abstract class _$$SetThemeRequestedImplCopyWith<$Res> {
  factory _$$SetThemeRequestedImplCopyWith(_$SetThemeRequestedImpl value,
          $Res Function(_$SetThemeRequestedImpl) then) =
      __$$SetThemeRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mode});
}

/// @nodoc
class __$$SetThemeRequestedImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetThemeRequestedImpl>
    implements _$$SetThemeRequestedImplCopyWith<$Res> {
  __$$SetThemeRequestedImplCopyWithImpl(_$SetThemeRequestedImpl _value,
      $Res Function(_$SetThemeRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
  }) {
    return _then(_$SetThemeRequestedImpl(
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetThemeRequestedImpl implements _SetThemeRequested {
  const _$SetThemeRequestedImpl(this.mode);

  @override
  final String mode;

  @override
  String toString() {
    return 'ThemeEvent.setThemeRequested(mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetThemeRequestedImpl &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetThemeRequestedImplCopyWith<_$SetThemeRequestedImpl> get copyWith =>
      __$$SetThemeRequestedImplCopyWithImpl<_$SetThemeRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleRequested,
    required TResult Function(String mode) setThemeRequested,
  }) {
    return setThemeRequested(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleRequested,
    TResult? Function(String mode)? setThemeRequested,
  }) {
    return setThemeRequested?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleRequested,
    TResult Function(String mode)? setThemeRequested,
    required TResult orElse(),
  }) {
    if (setThemeRequested != null) {
      return setThemeRequested(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleRequested value) toggleRequested,
    required TResult Function(_SetThemeRequested value) setThemeRequested,
  }) {
    return setThemeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleRequested value)? toggleRequested,
    TResult? Function(_SetThemeRequested value)? setThemeRequested,
  }) {
    return setThemeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleRequested value)? toggleRequested,
    TResult Function(_SetThemeRequested value)? setThemeRequested,
    required TResult orElse(),
  }) {
    if (setThemeRequested != null) {
      return setThemeRequested(this);
    }
    return orElse();
  }
}

abstract class _SetThemeRequested implements ThemeEvent {
  const factory _SetThemeRequested(final String mode) = _$SetThemeRequestedImpl;

  String get mode;
  @JsonKey(ignore: true)
  _$$SetThemeRequestedImplCopyWith<_$SetThemeRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
