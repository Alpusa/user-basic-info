import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user.dart';
import '../../../core/errors/failure.dart';

part 'users_list_state.freezed.dart';

@freezed
class UsersListState with _$UsersListState {
  const factory UsersListState.initial() = _Initial;
  const factory UsersListState.loading() = _Loading;
  const factory UsersListState.success(List<User> users) = _Success;
  const factory UsersListState.failure(Failure failure) = _Failure;
}
