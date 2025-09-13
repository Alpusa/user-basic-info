import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/entities/address.dart';

part 'user_summary_state.freezed.dart';

@freezed
class UserSummaryState with _$UserSummaryState {
  const factory UserSummaryState({
    @Default(false) bool isLoading,
    User? user,
    @Default(<Address>[]) List<Address> addresses,
    Failure? failure,
  }) = _UserSummaryState;

  const UserSummaryState._();
  factory UserSummaryState.initial() =>
      const UserSummaryState(isLoading: false);
}
