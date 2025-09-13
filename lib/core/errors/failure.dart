import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unexpected([String? message]) = _Unexpected;
  const factory Failure.network([String? message]) = _Network;
  const factory Failure.notFound([String? message]) = _NotFound;
  const factory Failure.validation([String? message]) = _Validation;
}
