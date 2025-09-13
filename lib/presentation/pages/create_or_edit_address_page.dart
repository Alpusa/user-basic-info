import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_csc_picker/country_state_city_picker.dart';

import '../bloc/address_form/address_form_bloc.dart';
import '../bloc/address_form/address_form_event.dart';
import '../bloc/address_form/address_form_state.dart';
import '../../core/errors/failure.dart';

class CreateOrEditAddressPage extends StatefulWidget {
  const CreateOrEditAddressPage({super.key});

  @override
  State<CreateOrEditAddressPage> createState() => _CreateOrEditAddressPageState();
}

class _CreateOrEditAddressPageState extends State<CreateOrEditAddressPage> {
  // controladores para cada campo del formulario
  final TextEditingController _paisCtrl = TextEditingController();
  final TextEditingController _departamentoCtrl = TextEditingController();
  final TextEditingController _municipioCtrl = TextEditingController();
  final TextEditingController _direccionCtrl = TextEditingController();

  final CountryStateCityData _cscData = CountryStateCityData();
  bool _dataLoaded = false;
  List<String> _countries = [];

  @override
  void initState() {
    super.initState();
    _loadCscData();
  }

  Future<void> _loadCscData() async {
    try {
      await _cscData.load();
      if (mounted) {
        _countries = List<String>.from(_cscData.countries)..sort((a, b) => a.compareTo(b));
        setState(() {
          _dataLoaded = true;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _dataLoaded = false);
    }
  }

  @override
  void dispose() {
    _paisCtrl.dispose();
    _departamentoCtrl.dispose();
    _municipioCtrl.dispose();
    _direccionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: cs.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: cs.onSurface),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        centerTitle: true,
        title: BlocBuilder<AddressFormBloc, AddressFormState>(
          builder: (context, state) {
            return Text(
              state.isEdit ? 'Editar dirección' : 'Crear dirección',
              style: TextStyle(
                color: cs.onSurface,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
      body: BlocConsumer<AddressFormBloc, AddressFormState>(
        listenWhen: (p, c) =>
            p.isSuccess != c.isSuccess || p.failure != c.failure || p.pais != c.pais || p.departamento != c.departamento || p.municipio != c.municipio || p.direccion != c.direccion,
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Guardado con éxito')));
            Navigator.of(context).pop(true);
          }
          if (state.failure != null) {
            final Failure f = state.failure!;
            final msg = f.when(
              unexpected: (m) => m ?? 'Ocurrió un error inesperado',
              network: (m) => m ?? 'Problema de red',
              notFound: (m) => m ?? 'No encontrado',
              validation: (m) => m ?? 'Error de validación',
            );
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(msg)));
          }
          if (_paisCtrl.text != state.pais) {
            _paisCtrl.text = state.pais;
          }
          if (_departamentoCtrl.text != state.departamento) {
            _departamentoCtrl.text = state.departamento;
          }
          if (_municipioCtrl.text != state.municipio) {
            _municipioCtrl.text = state.municipio;
          }
          if (_direccionCtrl.text != state.direccion) {
            _direccionCtrl.text = state.direccion;
          }
        },
        builder: (context, state) {
          final submitted = state.submitted;
          // Actualizar listas dependientes según el estado del BLoC
          String? selectedCountry = state.pais.isNotEmpty ? state.pais : null;
          String? selectedState = state.departamento.isNotEmpty ? state.departamento : null;
          List<String> states = [];
          List<City> cities = [];
          if (_dataLoaded && selectedCountry != null) {
            try {
              states = List<String>.from(_cscData.statesOf(selectedCountry))..sort((a, b) => a.compareTo(b));
            } catch (_) {
              states = [];
            }
          }
          if (_dataLoaded && selectedCountry != null && selectedState != null) {
            try {
              cities = List<City>.from(_cscData.citiesOf(selectedCountry, selectedState))..sort((a, b) => a.name.compareTo(b.name));
            } catch (_) {
              cities = [];
            }
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Selector País/Estado/Municipio
                if (!_dataLoaded)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Cargando países...',
                            style: TextStyle(color: cs.onSurface.withAlpha(180)),
                          ),
                        ],
                      ),
                    ),
                  )
                else ...[
                  // País (Autocomplete)
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return _countries;
                      }
                      return _countries.where((String option) {
                        return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    initialValue: TextEditingValue(text: _paisCtrl.text),
                    onSelected: (String selection) {
                      context.read<AddressFormBloc>().add(AddressFormEvent.paisChanged(selection));
                      // Limpiar dependientes
                      context.read<AddressFormBloc>().add(const AddressFormEvent.departamentoChanged(''));
                      context.read<AddressFormBloc>().add(const AddressFormEvent.municipioChanged(''));
                    },
                    fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: const InputDecoration(labelText: 'País'),
                        onEditingComplete: onEditingComplete,
                        style: TextStyle(color: cs.onSurface),
                      );
                    },
                  ),
                  if (submitted && !state.isValidPais)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text('Selecciona un país', style: TextStyle(color: Theme.of(context).colorScheme.error)),
                    ),
                  const SizedBox(height: 12),

                  // Departamento/Estado (Autocomplete)
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (selectedCountry == null) return const Iterable<String>.empty();
                      if (textEditingValue.text == '') {
                        return states;
                      }
                      return states.where((String option) {
                        return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    initialValue: TextEditingValue(text: _departamentoCtrl.text),
                    onSelected: (String selection) {
                      context.read<AddressFormBloc>().add(AddressFormEvent.departamentoChanged(selection));
                      // Limpiar municipio dependiente
                      context.read<AddressFormBloc>().add(const AddressFormEvent.municipioChanged(''));
                    },
                    fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: const InputDecoration(labelText: 'Departamento/Estado'),
                        onEditingComplete: onEditingComplete,
                      );
                    },
                  ),
                  if (submitted && !state.isValidDepartamento)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text('Selecciona un departamento/estado', style: TextStyle(color: Theme.of(context).colorScheme.error)),
                    ),
                  const SizedBox(height: 12),

                  // Municipio/Ciudad (Autocomplete)
                  Autocomplete<City>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (selectedCountry == null || selectedState == null) return const Iterable<City>.empty();
                      if (textEditingValue.text == '') {
                        return cities;
                      }
                      return cities.where((City option) {
                        return option.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    displayStringForOption: (City option) => option.name,
                    initialValue: TextEditingValue(text: _municipioCtrl.text),
                    onSelected: (City selection) {
                      context.read<AddressFormBloc>().add(AddressFormEvent.municipioChanged(selection.name));
                    },
                    fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: const InputDecoration(labelText: 'Municipio/Ciudad'),
                        onEditingComplete: onEditingComplete,
                      );
                    },
                  ),
                  if (submitted && !state.isValidMunicipio)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text('Selecciona un municipio/ciudad', style: TextStyle(color: Theme.of(context).colorScheme.error)),
                    ),
                ],

                const SizedBox(height: 16),
                Text(
                  'Dirección',
                  style: TextStyle(color: cs.onSurface.withAlpha(180)),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _direccionCtrl,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Ingresa la dirección',
                    hintStyle: TextStyle(
                      color: cs.onSurface.withAlpha(90),
                    ),
                    errorText: submitted && !state.isValidDireccion ? 'Campo requerido' : null,
                  ),
                  onChanged: (value) {
                    context.read<AddressFormBloc>().add(AddressFormEvent.direccionChanged(value));
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                            context.read<AddressFormBloc>().add(
                                  AddressFormEvent.submitPressed(
                                    pais: _paisCtrl.text,
                                    departamento: _departamentoCtrl.text,
                                    municipio: _municipioCtrl.text,
                                    direccion: _direccionCtrl.text,
                                  ),
                                );
                          },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      state.isSubmitting ? 'Guardando...' : 'Guardar',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

