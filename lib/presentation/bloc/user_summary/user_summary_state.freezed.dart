// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_summary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserSummaryState {
  bool get isLoading => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<Address> get addresses => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSummaryStateCopyWith<UserSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSummaryStateCopyWith<$Res> {
  factory $UserSummaryStateCopyWith(
          UserSummaryState value, $Res Function(UserSummaryState) then) =
      _$UserSummaryStateCopyWithImpl<$Res, UserSummaryState>;
  @useResult
  $Res call(
      {bool isLoading, User? user, List<Address> addresses, Failure? failure});

  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$UserSummaryStateCopyWithImpl<$Res, $Val extends UserSummaryState>
    implements $UserSummaryStateCopyWith<$Res> {
  _$UserSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
    Object? addresses = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
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
abstract class _$$UserSummaryStateImplCopyWith<$Res>
    implements $UserSummaryStateCopyWith<$Res> {
  factory _$$UserSummaryStateImplCopyWith(_$UserSummaryStateImpl value,
          $Res Function(_$UserSummaryStateImpl) then) =
      __$$UserSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, User? user, List<Address> addresses, Failure? failure});

  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$UserSummaryStateImplCopyWithImpl<$Res>
    extends _$UserSummaryStateCopyWithImpl<$Res, _$UserSummaryStateImpl>
    implements _$$UserSummaryStateImplCopyWith<$Res> {
  __$$UserSummaryStateImplCopyWithImpl(_$UserSummaryStateImpl _value,
      $Res Function(_$UserSummaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
    Object? addresses = null,
    Object? failure = freezed,
  }) {
    return _then(_$UserSummaryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$UserSummaryStateImpl extends _UserSummaryState {
  const _$UserSummaryStateImpl(
      {this.isLoading = false,
      this.user,
      final List<Address> addresses = const <Address>[],
      this.failure})
      : _addresses = addresses,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final User? user;
  final List<Address> _addresses;
  @override
  @JsonKey()
  List<Address> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'UserSummaryState(isLoading: $isLoading, user: $user, addresses: $addresses, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSummaryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, user,
      const DeepCollectionEquality().hash(_addresses), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSummaryStateImplCopyWith<_$UserSummaryStateImpl> get copyWith =>
      __$$UserSummaryStateImplCopyWithImpl<_$UserSummaryStateImpl>(
          this, _$identity);
}

abstract class _UserSummaryState extends UserSummaryState {
  const factory _UserSummaryState(
      {final bool isLoading,
      final User? user,
      final List<Address> addresses,
      final Failure? failure}) = _$UserSummaryStateImpl;
  const _UserSummaryState._() : super._();

  @override
  bool get isLoading;
  @override
  User? get user;
  @override
  List<Address> get addresses;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$UserSummaryStateImplCopyWith<_$UserSummaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
