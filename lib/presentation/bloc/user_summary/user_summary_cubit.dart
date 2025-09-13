import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_basic_info/domain/usecases/get_addresses_by_user_id.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/usecases/get_user_by_id.dart';
import 'user_summary_state.dart';

class UserSummaryCubit extends Cubit<UserSummaryState> {
  final GetUserById _getUserById;
  final GetAddressesByUserId _getAddressesByUserId;
  UserSummaryCubit(this._getUserById, this._getAddressesByUserId)
    : super(UserSummaryState.initial());

  Future<void> load(String id) async {
    emit(state.copyWith(isLoading: true, failure: null));
    final userEither = await _getUserById(id);
    await userEither.fold(
      (f) async => emit(state.copyWith(isLoading: false, failure: f)),
      (u) async {
        if (u == null) {
          emit(
            state.copyWith(
              isLoading: false,
              failure: const Failure.notFound('Usuario no encontrado'),
            ),
          );
          return;
        }
        // Recuperar direcciones
        final addrsEither = await _getAddressesByUserId(id);
        addrsEither.fold(
          (f) => emit(state.copyWith(isLoading: false, user: u, failure: f)),
          (list) => emit(
            state.copyWith(
              isLoading: false,
              user: u,
              addresses: list,
              failure: null,
            ),
          ),
        );
      },
    );
  }
}
