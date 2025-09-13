import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_all_addresses.dart';
import '../../../domain/usecases/search_addresses.dart';
import 'addresses_list_event.dart';
import 'addresses_list_state.dart';

class AddressesListBloc extends Bloc<AddressesListEvent, AddressesListState> {
  final GetAllAddresses _getAll;
  final SearchAddresses _search;

  AddressesListBloc(this._getAll, this._search) : super(const AddressesListState.initial()) {
  on<LoadRequested>(_handleLoad);
  on<SearchRequested>(_handleSearch);
  }

  Future<void> _handleLoad(LoadRequested event, Emitter<AddressesListState> emit) async {
    await _performLoad(emit);
  }

  Future<void> _handleSearch(SearchRequested event, Emitter<AddressesListState> emit) async {
    final q = event.query ?? '';
    final pais = event.pais;
    final departamento = event.departamento;
    final municipio = event.municipio;
    if (q.trim().isEmpty && pais == null && departamento == null && municipio == null) {
      return _performLoad(emit);
    }
    emit(const AddressesListState.loading());
    final result = await _search(
      containsText: q.isEmpty ? null : q,
      pais: pais,
      departamento: departamento,
      municipio: municipio,
    );
    result.fold(
      (f) => emit(AddressesListState.failure(f)),
      (items) => emit(AddressesListState.success(items)),
    );
  }

  Future<void> _performLoad(Emitter<AddressesListState> emit) async {
    emit(const AddressesListState.loading());
    final result = await _getAll();
    result.fold(
      (f) => emit(AddressesListState.failure(f)),
      (items) => emit(AddressesListState.success(items)),
    );
  }
}
