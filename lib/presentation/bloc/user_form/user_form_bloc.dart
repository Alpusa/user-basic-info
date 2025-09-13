import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:user_basic_info/domain/usecases/get_user_by_id.dart';

import '../../../core/errors/failure.dart';
import '../../../domain/entities/user.dart' as d;
import '../../../domain/usecases/save_user.dart';
import '../../../domain/usecases/update_user.dart';
import 'user_form_event.dart';
import 'user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  final SaveUser _saveUser;
  final UpdateUser _updateUser;
  final GetUserById _getUserById;

  UserFormBloc(this._saveUser, this._updateUser, this._getUserById)
    : super(const UserFormState()) {
    on<UserFormEvent>((event, emit) async {
      await event.map(
        initialized: (e) async => _onInitialized(e.userId, emit),
        submitPressed: (e) async =>
            _onSubmitPressed(e.nombre, e.apellido, e.fechaNacimiento, emit),
      );
    });
  }

  Future<void> _onInitialized(
    String? userId,
    Emitter<UserFormState> emit,
  ) async {
    if (userId == null || userId.isEmpty) return;
    final result = await _getUserById(userId);
    result.fold(
      (f) => emit(state.copyWith(isEdit: true, id: userId, failure: f)),
      (user) {
        if (user == null) {
          emit(
            state.copyWith(
              isEdit: true,
              id: userId,
              failure: const Failure.notFound('Usuario no encontrado'),
            ),
          );
          return;
        }
        final fechaText =
            '${user.fechaNacimiento.day.toString().padLeft(2, '0')}/${user.fechaNacimiento.month.toString().padLeft(2, '0')}/${user.fechaNacimiento.year}';
        emit(
          state.copyWith(
            isEdit: true,
            id: user.id.isNotEmpty ? user.id : userId,
            nombre: user.nombre,
            apellido: user.apellido,
            fechaNacimiento: user.fechaNacimiento,
            fechaText: fechaText,
            failure: null,
          ),
        );
      },
    );
  }

  Future<void> _onSubmitPressed(
    String? nombre,
    String? apellido,
    String? fechaNacimiento,
    Emitter<UserFormState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitted: true,
        failure: null,
        isSuccess: false,
      ),
    );

    if (!(nombre != null &&
        nombre.isNotEmpty &&
        apellido != null &&
        apellido.isNotEmpty &&
        fechaNacimiento != null &&
        fechaNacimiento.isNotEmpty)) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }
    final parsed = _parseDate(fechaNacimiento);
    // Validación: la fecha mínima aceptada es hoy (no se permiten fechas anteriores)
    if (parsed != null) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      if (parsed.isAfter(today)) {
        emit(
          state.copyWith(
            isSubmitting: false,
            failure: const Failure.validation(
              'La fecha no puede ser posterior a hoy',
            ),
          ),
        );
        return;
      }
    }

    final user = d.User(
      id: state.id ?? '',
      nombre: nombre,
      apellido: apellido,
      fechaNacimiento: parsed!,
    );

    final Either<Failure, Unit> result = state.isEdit
        ? await _updateUser(user)
        : await _saveUser(user);

    result.fold(
      (f) => emit(state.copyWith(isSubmitting: false, failure: f)),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }

  DateTime? _parseDate(String? text) {
    if (text == null) return null;
    final parts = text.split('/');
    if (parts.length != 3) return null;
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    if (day == null || month == null || year == null) return null;
    try {
      final dt = DateTime(year, month, day);
      if (dt.year == year && dt.month == month && dt.day == day) {
        return dt;
      }
    } catch (_) {}
    return null;
  }
}
