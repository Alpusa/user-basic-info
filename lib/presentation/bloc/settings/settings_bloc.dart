import 'package:flutter_bloc/flutter_bloc.dart';
// flutter/material imports not required here
// Hive not required in this bloc; locale handling moved to LocaleBloc
import '../../../domain/usecases/get_all_users.dart';
import '../../../domain/usecases/get_all_addresses.dart';
import '../../../domain/usecases/delete_user.dart';
import '../../../domain/usecases/delete_address.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetAllUsers _getAllUsers;
  final GetAllAddresses _getAllAddresses;
  final DeleteUser _deleteUser;
  final DeleteAddress _deleteAddress;

  SettingsBloc(
    this._getAllUsers,
    this._getAllAddresses,
    this._deleteUser,
    this._deleteAddress,
  ) : super(const SettingsState.initial()) {
    on<LoadRequested>(_onLoad);
    on<DeleteAllUsersRequested>(_onDeleteAllUsers);
    on<DeleteAllAddressesRequested>(_onDeleteAllAddresses);
  // Locale handling moved to LocaleBloc; SettingsBloc no longer persists locale
  }

  // Locale persistence handled by LocaleBloc

  Future<void> _onLoad(LoadRequested event, Emitter<SettingsState> emit) async {
    emit(const SettingsState.loading());
    final usersRes = await _getAllUsers.call();
    final addrsRes = await _getAllAddresses.call();

    int usersCount = 0;
    int addrsCount = 0;

    usersRes.match((l) => null, (users) => usersCount = users.length);
    addrsRes.match((l) => null, (addrs) => addrsCount = addrs.length);

    emit(
      SettingsState.success(usersCount: usersCount, addressesCount: addrsCount),
    );
  }

  Future<void> _onDeleteAllUsers(
    DeleteAllUsersRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    final usersRes = await _getAllUsers.call();
    int deleted = 0;

    await usersRes.match((failure) => null, (users) async {
      for (final u in users) {
        final res = await _deleteUser.call(u.id);
        res.match((l) => null, (r) => deleted++);
      }
    });

    add(LoadRequested());
    emit(SettingsState.success(usersCount: 0, addressesCount: 0));
  }

  Future<void> _onDeleteAllAddresses(
    DeleteAllAddressesRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    final addrsRes = await _getAllAddresses.call();
    int deleted = 0;

    await addrsRes.match((failure) => null, (addrs) async {
      for (final a in addrs) {
        final id = a.id;
        if (id == null) continue;
        final res = await _deleteAddress.call(id);
        res.match((l) => null, (r) => deleted++);
      }
    });

    add(LoadRequested());
    emit(SettingsState.success(usersCount: 0, addressesCount: 0));
  }
}
