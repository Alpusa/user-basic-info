import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_list_event.freezed.dart';

@freezed
class UsersListEvent with _$UsersListEvent {
  const factory UsersListEvent.loadRequested() = LoadRequested;
  const factory UsersListEvent.searchRequested(String query) = SearchRequested;
}
