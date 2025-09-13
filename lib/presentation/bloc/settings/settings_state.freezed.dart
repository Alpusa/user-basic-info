// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  int get usersCount => throw _privateConstructorUsedError;
  int get addressesCount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, int usersCount, int addressesCount)
        initial,
    required TResult Function(int usersCount, int addressesCount) loading,
    required TResult Function(int usersCount, int addressesCount) success,
    required TResult Function(
            String message, int usersCount, int addressesCount)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult? Function(int usersCount, int addressesCount)? loading,
    TResult? Function(int usersCount, int addressesCount)? success,
    TResult? Function(String message, int usersCount, int addressesCount)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult Function(int usersCount, int addressesCount)? loading,
    TResult Function(int usersCount, int addressesCount)? success,
    TResult Function(String message, int usersCount, int addressesCount)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({int usersCount, int addressesCount});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersCount = null,
    Object? addressesCount = null,
  }) {
    return _then(_value.copyWith(
      usersCount: null == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int,
      addressesCount: null == addressesCount
          ? _value.addressesCount
          : addressesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, int usersCount, int addressesCount});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? usersCount = null,
    Object? addressesCount = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      usersCount: null == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int,
      addressesCount: null == addressesCount
          ? _value.addressesCount
          : addressesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isLoading = false, this.usersCount = 0, this.addressesCount = 0});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int usersCount;
  @override
  @JsonKey()
  final int addressesCount;

  @override
  String toString() {
    return 'SettingsState.initial(isLoading: $isLoading, usersCount: $usersCount, addressesCount: $addressesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.usersCount, usersCount) ||
                other.usersCount == usersCount) &&
            (identical(other.addressesCount, addressesCount) ||
                other.addressesCount == addressesCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, usersCount, addressesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, int usersCount, int addressesCount)
        initial,
    required TResult Function(int usersCount, int addressesCount) loading,
    required TResult Function(int usersCount, int addressesCount) success,
    required TResult Function(
            String message, int usersCount, int addressesCount)
        failure,
  }) {
    return initial(isLoading, usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult? Function(int usersCount, int addressesCount)? loading,
    TResult? Function(int usersCount, int addressesCount)? success,
    TResult? Function(String message, int usersCount, int addressesCount)?
        failure,
  }) {
    return initial?.call(isLoading, usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult Function(int usersCount, int addressesCount)? loading,
    TResult Function(int usersCount, int addressesCount)? success,
    TResult Function(String message, int usersCount, int addressesCount)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, usersCount, addressesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SettingsState {
  const factory _Initial(
      {final bool isLoading,
      final int usersCount,
      final int addressesCount}) = _$InitialImpl;

  bool get isLoading;
  @override
  int get usersCount;
  @override
  int get addressesCount;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int usersCount, int addressesCount});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersCount = null,
    Object? addressesCount = null,
  }) {
    return _then(_$LoadingImpl(
      usersCount: null == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int,
      addressesCount: null == addressesCount
          ? _value.addressesCount
          : addressesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({this.usersCount = 0, this.addressesCount = 0});

  @override
  @JsonKey()
  final int usersCount;
  @override
  @JsonKey()
  final int addressesCount;

  @override
  String toString() {
    return 'SettingsState.loading(usersCount: $usersCount, addressesCount: $addressesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.usersCount, usersCount) ||
                other.usersCount == usersCount) &&
            (identical(other.addressesCount, addressesCount) ||
                other.addressesCount == addressesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usersCount, addressesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, int usersCount, int addressesCount)
        initial,
    required TResult Function(int usersCount, int addressesCount) loading,
    required TResult Function(int usersCount, int addressesCount) success,
    required TResult Function(
            String message, int usersCount, int addressesCount)
        failure,
  }) {
    return loading(usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult? Function(int usersCount, int addressesCount)? loading,
    TResult? Function(int usersCount, int addressesCount)? success,
    TResult? Function(String message, int usersCount, int addressesCount)?
        failure,
  }) {
    return loading?.call(usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult Function(int usersCount, int addressesCount)? loading,
    TResult Function(int usersCount, int addressesCount)? success,
    TResult Function(String message, int usersCount, int addressesCount)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(usersCount, addressesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SettingsState {
  const factory _Loading({final int usersCount, final int addressesCount}) =
      _$LoadingImpl;

  @override
  int get usersCount;
  @override
  int get addressesCount;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int usersCount, int addressesCount});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usersCount = null,
    Object? addressesCount = null,
  }) {
    return _then(_$SuccessImpl(
      usersCount: null == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int,
      addressesCount: null == addressesCount
          ? _value.addressesCount
          : addressesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.usersCount, required this.addressesCount});

  @override
  final int usersCount;
  @override
  final int addressesCount;

  @override
  String toString() {
    return 'SettingsState.success(usersCount: $usersCount, addressesCount: $addressesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.usersCount, usersCount) ||
                other.usersCount == usersCount) &&
            (identical(other.addressesCount, addressesCount) ||
                other.addressesCount == addressesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usersCount, addressesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, int usersCount, int addressesCount)
        initial,
    required TResult Function(int usersCount, int addressesCount) loading,
    required TResult Function(int usersCount, int addressesCount) success,
    required TResult Function(
            String message, int usersCount, int addressesCount)
        failure,
  }) {
    return success(usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult? Function(int usersCount, int addressesCount)? loading,
    TResult? Function(int usersCount, int addressesCount)? success,
    TResult? Function(String message, int usersCount, int addressesCount)?
        failure,
  }) {
    return success?.call(usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult Function(int usersCount, int addressesCount)? loading,
    TResult Function(int usersCount, int addressesCount)? success,
    TResult Function(String message, int usersCount, int addressesCount)?
        failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(usersCount, addressesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SettingsState {
  const factory _Success(
      {required final int usersCount,
      required final int addressesCount}) = _$SuccessImpl;

  @override
  int get usersCount;
  @override
  int get addressesCount;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int usersCount, int addressesCount});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? usersCount = null,
    Object? addressesCount = null,
  }) {
    return _then(_$FailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      usersCount: null == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int,
      addressesCount: null == addressesCount
          ? _value.addressesCount
          : addressesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(
      {required this.message, this.usersCount = 0, this.addressesCount = 0});

  @override
  final String message;
  @override
  @JsonKey()
  final int usersCount;
  @override
  @JsonKey()
  final int addressesCount;

  @override
  String toString() {
    return 'SettingsState.failure(message: $message, usersCount: $usersCount, addressesCount: $addressesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.usersCount, usersCount) ||
                other.usersCount == usersCount) &&
            (identical(other.addressesCount, addressesCount) ||
                other.addressesCount == addressesCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, usersCount, addressesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, int usersCount, int addressesCount)
        initial,
    required TResult Function(int usersCount, int addressesCount) loading,
    required TResult Function(int usersCount, int addressesCount) success,
    required TResult Function(
            String message, int usersCount, int addressesCount)
        failure,
  }) {
    return failure(message, usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult? Function(int usersCount, int addressesCount)? loading,
    TResult? Function(int usersCount, int addressesCount)? success,
    TResult? Function(String message, int usersCount, int addressesCount)?
        failure,
  }) {
    return failure?.call(message, usersCount, addressesCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, int usersCount, int addressesCount)?
        initial,
    TResult Function(int usersCount, int addressesCount)? loading,
    TResult Function(int usersCount, int addressesCount)? success,
    TResult Function(String message, int usersCount, int addressesCount)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message, usersCount, addressesCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements SettingsState {
  const factory _Failure(
      {required final String message,
      final int usersCount,
      final int addressesCount}) = _$FailureImpl;

  String get message;
  @override
  int get usersCount;
  @override
  int get addressesCount;
  @override
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
