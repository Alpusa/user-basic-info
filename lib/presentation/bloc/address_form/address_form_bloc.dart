import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/failure.dart';
import '../../../domain/entities/address.dart' as da;
import '../../../domain/entities/user.dart' as du;
import '../../../domain/usecases/save_address.dart';
import '../../../domain/usecases/update_address.dart';
import '../../../domain/usecases/get_address_by_id.dart';
import '../../../domain/usecases/get_user_by_id.dart';
import 'address_form_event.dart';
import 'address_form_state.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  final SaveAddress _saveAddress;
  final UpdateAddress _updateAddress;
  final GetAddressById _getAddressById;
  final GetUserById _getUserById;

  AddressFormBloc(
    this._saveAddress,
    this._updateAddress,
    this._getAddressById,
    this._getUserById,
  ) : super(const AddressFormState()) {
    on<AddressFormEvent>((event, emit) async {
      await event.map(
        initialized: (e) async => _onInitialized(e.addressId, e.userId, emit),
        paisChanged: (e) async => emit(state.copyWith(pais: e.pais)),
        departamentoChanged: (e) async =>
            emit(state.copyWith(departamento: e.departamento)),
        municipioChanged: (e) async =>
            emit(state.copyWith(municipio: e.municipio)),
        direccionChanged: (e) async =>
            emit(state.copyWith(direccion: e.direccion)),
        submitPressed: (e) async => _onSubmitPressed(
          e.pais,
          e.departamento,
          e.municipio,
          e.direccion,
          emit,
        ),
      );
    });
  }

  Future<void> _onInitialized(
    String? addressId,
    String? userId,
    Emitter<AddressFormState> emit,
  ) async {
    if (addressId != null && addressId.isNotEmpty) {
      final result = await _getAddressById(addressId);
      result.fold(
        (f) => emit(state.copyWith(isEdit: true, id: addressId, failure: f)),
        (addr) {
          if (addr == null) {
            emit(
              state.copyWith(
                isEdit: true,
                id: addressId,
                failure: const Failure.notFound('Dirección no encontrada'),
              ),
            );
            return;
          }
          emit(
            state.copyWith(
              isEdit: true,
              id: addressId,
              userId: addr.userId,
              pais: addr.pais,
              departamento: addr.departamento,
              municipio: addr.municipio,
              direccion: addr.direccion,
              failure: null,
            ),
          );
        },
      );
    } else if (userId != null && userId.isNotEmpty) {
      emit(state.copyWith(userId: userId));
    }
  }

  Future<void> _onSubmitPressed(
    String? pais,
    String? departamento,
    String? municipio,
    String? direccion,
    Emitter<AddressFormState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        submitted: true,
        failure: null,
        isSuccess: false,
      ),
    );

    final valid =
        (pais != null && pais.isNotEmpty) &&
        (departamento != null && departamento.isNotEmpty) &&
        (municipio != null && municipio.isNotEmpty) &&
        (direccion != null && direccion.isNotEmpty);
    if (!valid) {
      emit(state.copyWith(isSubmitting: false));
      return;
    }

    final da.Address address = da.Address(
      id: state.id,
      userId: state.userId,
      pais: pais,
      departamento: departamento,
      municipio: municipio,
      direccion: direccion,
    );

    Either<Failure, Unit> result;
    if (state.isEdit && (state.id != null && state.id!.isNotEmpty)) {
      result = await _updateAddress(state.id!, address);
    } else {
      // Para crear se requiere el usuario
      if (state.userId == null || state.userId!.isEmpty) {
        emit(
          state.copyWith(
            isSubmitting: false,
            failure: const Failure.validation(
              'Falta el usuario para la dirección',
            ),
          ),
        );
        return;
      }
      final userRes = await _getUserById(state.userId!);
      final user = userRes.fold<du.User?>((f) => null, (u) => u);
      if (user == null) {
        emit(
          state.copyWith(
            isSubmitting: false,
            failure: const Failure.notFound('Usuario no encontrado'),
          ),
        );
        return;
      }
      result = await _saveAddress(user, address);
    }

    result.fold(
      (f) => emit(state.copyWith(isSubmitting: false, failure: f)),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }
}
