import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_csc_picker/country_state_city_picker.dart';

import '../bloc/addresses_list/addresses_list_bloc.dart';
import '../bloc/addresses_list/addresses_list_event.dart';
import '../bloc/addresses_list/addresses_list_state.dart';
import 'package:go_router/go_router.dart';
import '../widgets/address_item.dart';
import 'package:get_it/get_it.dart';
import '../../domain/usecases/delete_address.dart';
import '../../core/router/names_router.dart';
import '../widgets/app_loading.dart';
import '../../core/errors/failure.dart';
import 'package:user_basic_info/l10n/app_localizations.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  final TextEditingController _searchCtrl = TextEditingController();
  Timer? _debounce;
  // filtros de país/estado/municipio
  final CountryStateCityData _cscData = CountryStateCityData();
  bool _dataLoaded = false;
  List<String> _countries = [];
  final TextEditingController _paisCtrl = TextEditingController();
  final TextEditingController _departamentoCtrl = TextEditingController();
  final TextEditingController _municipioCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AddressesListBloc>().add(
      const AddressesListEvent.loadRequested(),
    );
    _loadCscData();
  }

  Future<void> _loadCscData() async {
    try {
      await _cscData.load();
      if (mounted) {
        _countries = List<String>.from(_cscData.countries)
          ..sort((a, b) => a.compareTo(b));
        setState(() {
          _dataLoaded = true;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _dataLoaded = false);
    }
  }

  void _onSearchChanged(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = v.trim();
      final bloc = context.read<AddressesListBloc>();
      if (query.isEmpty) {
        bloc.add(const AddressesListEvent.loadRequested());
      } else {
        bloc.add(AddressesListEvent.searchRequested(query: query));
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    _paisCtrl.dispose();
    _departamentoCtrl.dispose();
    _municipioCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addresses),
        actions: [
          IconButton(
            tooltip: AppLocalizations.of(context)!.refresh,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final query = _searchCtrl.text.trim();
              final bloc = context.read<AddressesListBloc>();
              if (query.isEmpty) {
                bloc.add(const AddressesListEvent.loadRequested());
              } else {
                bloc.add(AddressesListEvent.searchRequested(query: query));
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Buscador libre
                TextField(
                  controller: _searchCtrl,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: AppLocalizations.of(context)!.searchAddresses,
                    suffixIcon: ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _searchCtrl,
                      builder: (context, value, _) {
                        if (value.text.isEmpty) return const SizedBox.shrink();
                        return IconButton(
                          tooltip: AppLocalizations.of(context)!.clear,
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchCtrl.clear();
                            context.read<AddressesListBloc>().add(
                              const AddressesListEvent.loadRequested(),
                            );
                          },
                        );
                      },
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Filtros País/Departamento/Municipio
                if (!_dataLoaded) const SizedBox.shrink() else ...[
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return _countries;
                      }
                      return _countries.where((String option) {
                        return option.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        );
                      });
                    },
                    onSelected: (String selection) {
                      _paisCtrl.text = selection;
                      // limpiar dependientes
                      _departamentoCtrl.clear();
                      _municipioCtrl.clear();
                      context.read<AddressesListBloc>().add(
                        AddressesListEvent.searchRequested(pais: selection),
                      );
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                          return TextFormField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(labelText: AppLocalizations.of(context)!.country),
                          );
                        },
                  ),
                  const SizedBox(height: 8),
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      final selectedCountry = _paisCtrl.text.isNotEmpty
                          ? _paisCtrl.text
                          : null;
                      if (selectedCountry == null) {
                        return const Iterable<String>.empty();
                      }
                      List<String> states;
                      try {
                        states = List<String>.from(
                          _cscData.statesOf(selectedCountry),
                        )..sort((a, b) => a.compareTo(b));
                      } catch (_) {
                        states = [];
                      }
                      if (textEditingValue.text == '') {
                        return states;
                      }
                      return states.where((String option) {
                        return option.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        );
                      });
                    },
                    onSelected: (String selection) {
                      _departamentoCtrl.text = selection;
                      _municipioCtrl.clear();
                      context.read<AddressesListBloc>().add(
                        AddressesListEvent.searchRequested(
                          pais: _paisCtrl.text,
                          departamento: selection,
                        ),
                      );
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                          return TextFormField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(labelText: AppLocalizations.of(context)!.state),
                          );
                        },
                  ),
                  const SizedBox(height: 8),
                  Autocomplete<City>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      final selectedCountry = _paisCtrl.text.isNotEmpty
                          ? _paisCtrl.text
                          : null;
                      final selectedState = _departamentoCtrl.text.isNotEmpty
                          ? _departamentoCtrl.text
                          : null;
                      if (selectedCountry == null || selectedState == null) {
                        return const Iterable<City>.empty();
                      }
                      List<City> cities;
                      try {
                        cities = List<City>.from(
                          _cscData.citiesOf(selectedCountry, selectedState),
                        )..sort((a, b) => a.name.compareTo(b.name));
                      } catch (_) {
                        cities = [];
                      }
                      if (textEditingValue.text == '') {
                        return cities;
                      }
                      return cities.where((City option) {
                        return option.name.toLowerCase().contains(
                          textEditingValue.text.toLowerCase(),
                        );
                      });
                    },
                    displayStringForOption: (City option) => option.name,
                    onSelected: (City selection) {
                      _municipioCtrl.text = selection.name;
                      context.read<AddressesListBloc>().add(
                        AddressesListEvent.searchRequested(
                          pais: _paisCtrl.text,
                          departamento: _departamentoCtrl.text,
                          municipio: selection.name,
                        ),
                      );
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                          return TextFormField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(labelText: AppLocalizations.of(context)!.city),
                          );
                        },
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<AddressesListBloc>().add(
                  const AddressesListEvent.loadRequested(),
                );
              },
              child: BlocBuilder<AddressesListBloc, AddressesListState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => AppLoading(message: AppLocalizations.of(context)!.loadingAddresses),
                    loading: () => AppLoading(message: AppLocalizations.of(context)!.loadingAddresses),
                    failure: (failure) => Center(child: Text(_failureMessage(context, failure))),
                    success: (items) {
                      if (items.isEmpty) {
                        return Center(child: Text(AppLocalizations.of(context)!.noAddresses));
                      }
                      return ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const Divider(height: 0),
                        itemBuilder: (context, index) {
                          final a = items[index];
                          final title = a.municipio.isNotEmpty
                              ? a.municipio
                              : (a.departamento.isNotEmpty
                                    ? a.departamento
                                    : a.pais);
                          final subtitle =
                              '${a.direccion}${a.municipio.isNotEmpty ? ', ${a.municipio}' : ''}';
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: AddressItem(
                              title: title,
                              subtitle: subtitle,
                              onTap: () async {
                                final id = a.id;
                                if (id == null || id.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(AppLocalizations.of(context)!.invalidAddressId)),
                                  );
                                  return;
                                }
                                final result = await context.push(
                                  '${NamesRouter.createEditAddress}?id=$id',
                                );
                                if (result == true) {
                                  if (!mounted) return;
                                  this.context.read<AddressesListBloc>().add(
                                    const AddressesListEvent.loadRequested(),
                                  );
                                }
                              },
                              onEdit: () async {
                                final id = a.id;
                                if (id == null || id.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(AppLocalizations.of(context)!.invalidAddressId)),
                                  );
                                  return;
                                }
                                final result = await context.push(
                                  '${NamesRouter.createEditAddress}?id=$id',
                                );
                                if (result == true) {
                                  if (!mounted) return;
                                  this.context.read<AddressesListBloc>().add(
                                    const AddressesListEvent.loadRequested(),
                                  );
                                }
                              },
                              onDelete: () async {
                                final id = a.id;
                                if (id == null || id.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(AppLocalizations.of(context)!.invalidAddressId)),
                                  );
                                  return;
                                }
                                final deleteAddress = GetIt.I<DeleteAddress>();
                                final messenger = ScaffoldMessenger.of(this.context);
                                final bloc = this.context.read<AddressesListBloc>();
                                final t = AppLocalizations.of(this.context)!;
                                final res = await deleteAddress(id);
                                res.fold(
                                  (f) {
                                    final failureMsg = f.when(
                                      unexpected: (m) => m ?? t.unexpectedError,
                                      network: (m) => m ?? t.networkError,
                                      notFound: (m) => m ?? t.notFoundError,
                                      validation: (m) => m ?? t.validationError,
                                    );
                                    messenger.showSnackBar(SnackBar(content: Text(failureMsg)));
                                  },
                                  (_) async {
                                    messenger.showSnackBar(SnackBar(content: Text(t.addressDeleted)));
                                    if (!mounted) return;
                                    bloc.add(
                                      const AddressesListEvent.loadRequested(),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _failureMessage(BuildContext context, Failure failure) {
    final t = AppLocalizations.of(context)!;
    return failure.when(
      unexpected: (m) => m ?? t.unexpectedError,
      network: (m) => m ?? t.networkError,
      notFound: (m) => m ?? t.notFoundError,
      validation: (m) => m ?? t.validationError,
    );
  }
}
