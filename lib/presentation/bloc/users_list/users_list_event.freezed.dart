// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsersListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String query) searchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String query)? searchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String query)? searchRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(SearchRequested value) searchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(SearchRequested value)? searchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(SearchRequested value)? searchRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersListEventCopyWith<$Res> {
  factory $UsersListEventCopyWith(
          UsersListEvent value, $Res Function(UsersListEvent) then) =
      _$UsersListEventCopyWithImpl<$Res, UsersListEvent>;
}

/// @nodoc
class _$UsersListEventCopyWithImpl<$Res, $Val extends UsersListEvent>
    implements $UsersListEventCopyWith<$Res> {
  _$UsersListEventCopyWithImpl(this._value, this._then);

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
    extends _$UsersListEventCopyWithImpl<$Res, _$LoadRequestedImpl>
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
    return 'UsersListEvent.loadRequested()';
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
    required TResult Function(String query) searchRequested,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String query)? searchRequested,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String query)? searchRequested,
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
    required TResult Function(SearchRequested value) searchRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(SearchRequested value)? searchRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(SearchRequested value)? searchRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class LoadRequested implements UsersListEvent {
  const factory LoadRequested() = _$LoadRequestedImpl;
}

/// @nodoc
abstract class _$$SearchRequestedImplCopyWith<$Res> {
  factory _$$SearchRequestedImplCopyWith(_$SearchRequestedImpl value,
          $Res Function(_$SearchRequestedImpl) then) =
      __$$SearchRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchRequestedImplCopyWithImpl<$Res>
    extends _$UsersListEventCopyWithImpl<$Res, _$SearchRequestedImpl>
    implements _$$SearchRequestedImplCopyWith<$Res> {
  __$$SearchRequestedImplCopyWithImpl(
      _$SearchRequestedImpl _value, $Res Function(_$SearchRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchRequestedImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchRequestedImpl implements SearchRequested {
  const _$SearchRequestedImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'UsersListEvent.searchRequested(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRequestedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRequestedImplCopyWith<_$SearchRequestedImpl> get copyWith =>
      __$$SearchRequestedImplCopyWithImpl<_$SearchRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String query) searchRequested,
  }) {
    return searchRequested(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String query)? searchRequested,
  }) {
    return searchRequested?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String query)? searchRequested,
    required TResult orElse(),
  }) {
    if (searchRequested != null) {
      return searchRequested(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(SearchRequested value) searchRequested,
  }) {
    return searchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(SearchRequested value)? searchRequested,
  }) {
    return searchRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(SearchRequested value)? searchRequested,
    required TResult orElse(),
  }) {
    if (searchRequested != null) {
      return searchRequested(this);
    }
    return orElse();
  }
}

abstract class SearchRequested implements UsersListEvent {
  const factory SearchRequested(final String query) = _$SearchRequestedImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchRequestedImplCopyWith<_$SearchRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
