import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_all_users.dart';
import '../../../domain/usecases/search_users.dart';
import 'users_list_event.dart';
import 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final GetAllUsers _getAllUsers;
  final SearchUsers _searchUsers;

  UsersListBloc(this._getAllUsers, this._searchUsers)
    : super(const UsersListState.initial()) {
    on<LoadRequested>(_handleLoad);
    on<SearchRequested>(_handleSearch);
  }

  Future<void> _handleLoad(
    LoadRequested event,
    Emitter<UsersListState> emit,
  ) async {
    await _performLoad(emit);
  }

  Future<void> _handleSearch(
    SearchRequested event,
    Emitter<UsersListState> emit,
  ) async {
    final q = event.query;
    if (q.trim().isEmpty) {
      return _performLoad(emit);
    }
    emit(const UsersListState.loading());
    final result = await _searchUsers(query: q);
    result.fold(
      (failure) => emit(UsersListState.failure(failure)),
      (items) => emit(UsersListState.success(items)),
    );
  }

  Future<void> _performLoad(Emitter<UsersListState> emit) async {
    emit(const UsersListState.loading());
    final result = await _getAllUsers();
    result.fold(
      (failure) => emit(UsersListState.failure(failure)),
      (items) => emit(UsersListState.success(items)),
    );
  }
}
