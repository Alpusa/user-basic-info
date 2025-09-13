import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_form/user_form_bloc.dart';
import '../bloc/user_form/user_form_event.dart';
import '../bloc/user_form/user_form_state.dart';
import '../../core/errors/failure.dart';

class CreateOrEditUserPage extends StatelessWidget {
  // controladores para cada campo del formulario
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _apellidoCtrl = TextEditingController();
  final TextEditingController _fechaCtrl = TextEditingController();

  CreateOrEditUserPage({super.key});
  
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
        title: BlocBuilder<UserFormBloc, UserFormState>(
          builder: (context, state) {
            return Text(
              state.isEdit ? 'Editar cuenta' : 'Crear cuenta',
              style: TextStyle(
                color: cs.onSurface,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
      body: BlocConsumer<UserFormBloc, UserFormState>(
        listenWhen: (p, c) =>
            p.isSuccess != c.isSuccess || p.failure != c.failure || p.apellido != c.apellido || p.nombre != c.nombre || p.fechaText != c.fechaText,
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
          if (_nombreCtrl.text != state.nombre) {
            _nombreCtrl.text = state.nombre;
          }
          if (_apellidoCtrl.text != state.apellido) {
            _apellidoCtrl.text = state.apellido;
          }
          if (_fechaCtrl.text != state.fechaText) {
            _fechaCtrl.text = state.fechaText ?? '';
          }
        },
        builder: (context, state) {
          final submitted = state.submitted;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Nombre',
                  style: TextStyle(color: cs.onSurface.withOpacity(0.7)),
                ),
                const SizedBox(height: 6),
                TextFormField(

                  controller: _nombreCtrl,
                  decoration: InputDecoration(
                    hintText: 'Ingresa tu nombre',
                    hintStyle: TextStyle(color: cs.onSurface.withOpacity(0.35)),
                    errorText: submitted && !state.isValidNombre ? 'Campo requerido' : null,
                  ),

                ),
                const SizedBox(height: 16),
                Text(
                  'Apellido',
                  style: TextStyle(color: cs.onSurface.withOpacity(0.7)),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _apellidoCtrl,
                  decoration: InputDecoration(
                    hintText: 'Ingresa tu apellido',
                    hintStyle: TextStyle(color: cs.onSurface.withOpacity(0.35)),
                    errorText: submitted && !state.isValidApellido
                        ? 'Campo requerido'
                        : null,
                  ),

                ),
                const SizedBox(height: 16),
                Text(
                  'Fecha de nacimiento',
                  style: TextStyle(color: cs.onSurface.withOpacity(0.7)),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () async {
                    final now = DateTime.now();
                    // Aseguramos usar solo la parte de fecha (sin hora)
                    final today = DateTime(now.year, now.month, now.day);
                    final picked = await showDatePicker(
                      context: context,
                      // La fecha mínima debe ser la actual; inicial también dentro del rango
                      initialDate: state.fechaNacimiento != null && !state.fechaNacimiento!.isBefore(today)
                          ? state.fechaNacimiento!
                          : today,
                      firstDate: DateTime(1900),
                      lastDate: today,
                    );
                    if (picked != null) {
                      final text =
                          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString()}';
                      _fechaCtrl.text = text;
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _fechaCtrl,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'DD/MM/AAAA',
                        hintStyle: TextStyle(color: cs.onSurface.withOpacity(0.35)),
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: cs.onSurface.withOpacity(0.35),
                        ),
                        errorText: submitted && !state.isValidFecha
                            ? 'Fecha inválida'
                            : null,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                            context.read<UserFormBloc>().add(
                              UserFormEvent.submitPressed(
                                nombre: _nombreCtrl.text,
                                apellido: _apellidoCtrl.text,
                                fechaNacimiento: _fechaCtrl.text,
                              ),
                            );
                          },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                      state.isSubmitting ? 'Guardando...' : 'Siguiente',
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

