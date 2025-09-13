// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addresses_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressesListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String? query, String? pais, String? departamento,
            String? municipio)
        searchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String? query, String? pais, String? departamento,
            String? municipio)?
        searchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String? query, String? pais, String? departamento,
            String? municipio)?
        searchRequested,
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
abstract class $AddressesListEventCopyWith<$Res> {
  factory $AddressesListEventCopyWith(
          AddressesListEvent value, $Res Function(AddressesListEvent) then) =
      _$AddressesListEventCopyWithImpl<$Res, AddressesListEvent>;
}

/// @nodoc
class _$AddressesListEventCopyWithImpl<$Res, $Val extends AddressesListEvent>
    implements $AddressesListEventCopyWith<$Res> {
  _$AddressesListEventCopyWithImpl(this._value, this._then);

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
    extends _$AddressesListEventCopyWithImpl<$Res, _$LoadRequestedImpl>
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
    return 'AddressesListEvent.loadRequested()';
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
    required TResult Function(String? query, String? pais, String? departamento,
            String? municipio)
        searchRequested,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String? query, String? pais, String? departamento,
            String? municipio)?
        searchRequested,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String? query, String? pais, String? departamento,
            String? municipio)?
        searchRequested,
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

abstract class LoadRequested implements AddressesListEvent {
  const factory LoadRequested() = _$LoadRequestedImpl;
}

/// @nodoc
abstract class _$$SearchRequestedImplCopyWith<$Res> {
  factory _$$SearchRequestedImplCopyWith(_$SearchRequestedImpl value,
          $Res Function(_$SearchRequestedImpl) then) =
      __$$SearchRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? query, String? pais, String? departamento, String? municipio});
}

/// @nodoc
class __$$SearchRequestedImplCopyWithImpl<$Res>
    extends _$AddressesListEventCopyWithImpl<$Res, _$SearchRequestedImpl>
    implements _$$SearchRequestedImplCopyWith<$Res> {
  __$$SearchRequestedImplCopyWithImpl(
      _$SearchRequestedImpl _value, $Res Function(_$SearchRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? pais = freezed,
    Object? departamento = freezed,
    Object? municipio = freezed,
  }) {
    return _then(_$SearchRequestedImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc

class _$SearchRequestedImpl implements SearchRequested {
  const _$SearchRequestedImpl(
      {this.query, this.pais, this.departamento, this.municipio});

  @override
  final String? query;
  @override
  final String? pais;
  @override
  final String? departamento;
  @override
  final String? municipio;

  @override
  String toString() {
    return 'AddressesListEvent.searchRequested(query: $query, pais: $pais, departamento: $departamento, municipio: $municipio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRequestedImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.pais, pais) || other.pais == pais) &&
            (identical(other.departamento, departamento) ||
                other.departamento == departamento) &&
            (identical(other.municipio, municipio) ||
                other.municipio == municipio));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, pais, departamento, municipio);

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
    required TResult Function(String? query, String? pais, String? departamento,
            String? municipio)
        searchRequested,
  }) {
    return searchRequested(query, pais, departamento, municipio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String? query, String? pais, String? departamento,
            String? municipio)?
        searchRequested,
  }) {
    return searchRequested?.call(query, pais, departamento, municipio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String? query, String? pais, String? departamento,
            String? municipio)?
        searchRequested,
    required TResult orElse(),
  }) {
    if (searchRequested != null) {
      return searchRequested(query, pais, departamento, municipio);
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

abstract class SearchRequested implements AddressesListEvent {
  const factory SearchRequested(
      {final String? query,
      final String? pais,
      final String? departamento,
      final String? municipio}) = _$SearchRequestedImpl;

  String? get query;
  String? get pais;
  String? get departamento;
  String? get municipio;
  @JsonKey(ignore: true)
  _$$SearchRequestedImplCopyWith<_$SearchRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
