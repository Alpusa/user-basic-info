// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Información Básica de Usuario';

  @override
  String get navUsers => 'Usuarios';

  @override
  String get navAddresses => 'Direcciones';

  @override
  String get navSettings => 'Configuración';

  @override
  String get loading => 'Cargando...';

  @override
  String get loadingUsers => 'Cargando usuarios...';

  @override
  String get loadingAddresses => 'Cargando direcciones...';

  @override
  String get loadingUser => 'Cargando usuario...';

  @override
  String get deletingUsers => 'Eliminando usuarios...';

  @override
  String get deletingAddresses => 'Eliminando direcciones...';

  @override
  String get loadingCountries => 'Cargando países...';

  @override
  String get refresh => 'Refrescar';

  @override
  String get clear => 'Limpiar';

  @override
  String get createUser => 'Crear usuario';

  @override
  String get edit => 'Editar';

  @override
  String get editAccount => 'Editar cuenta';

  @override
  String get editAddress => 'Editar dirección';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteUser => 'Eliminar usuario';

  @override
  String get deleteAddress => 'Eliminar dirección';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirmDeleteAddress => '¿Deseas eliminar esta dirección?';

  @override
  String get confirmDeleteUser =>
      'Esta acción eliminará el usuario y sus direcciones. ¿Deseas continuar?';

  @override
  String get users => 'Usuarios';

  @override
  String get addresses => 'Direcciones';

  @override
  String get settings => 'Configuración';

  @override
  String get searchUsers => 'Buscar usuarios';

  @override
  String get searchAddresses => 'Buscar direcciones';

  @override
  String get noUsers => 'Sin usuarios';

  @override
  String get noAddresses => 'Sin direcciones';

  @override
  String get invalidAddressId => 'ID de dirección inválido';

  @override
  String get addressDeleted => 'Dirección eliminada';

  @override
  String get totalUsers => 'Total usuarios';

  @override
  String get totalAddresses => 'Total direcciones';

  @override
  String get deleteAllUsers => 'Eliminar todos los usuarios';

  @override
  String get deleteAllAddresses => 'Eliminar todas las direcciones';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get savedSuccessfully => 'Guardado con éxito';

  @override
  String get saving => 'Guardando...';

  @override
  String get next => 'Siguiente';

  @override
  String get save => 'Guardar';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get createAddress => 'Crear dirección';

  @override
  String get firstName => 'Nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get birthDate => 'Fecha de nacimiento';

  @override
  String get birthDateHint => 'DD/MM/AAAA';

  @override
  String get invalidDate => 'Fecha inválida';

  @override
  String get requiredField => 'Campo requerido';

  @override
  String get enterFirstName => 'Ingresa tu nombre';

  @override
  String get enterLastName => 'Ingresa tu apellido';

  @override
  String get country => 'País';

  @override
  String get state => 'Departamento/Estado';

  @override
  String get city => 'Municipio/Ciudad';

  @override
  String get selectCountry => 'Selecciona un país';

  @override
  String get selectState => 'Selecciona un departamento/estado';

  @override
  String get selectCity => 'Selecciona un municipio/ciudad';

  @override
  String get address => 'Dirección';

  @override
  String get enterAddress => 'Ingresa la dirección';

  @override
  String get userSummary => 'Resumen del Usuario';

  @override
  String get userNotFound => 'Usuario no encontrado';

  @override
  String get id => 'ID';

  @override
  String birthDatePrefix(Object date) {
    return 'Fecha de nacimiento: $date';
  }

  @override
  String get registeredAddresses => 'Direcciones Registradas';

  @override
  String get noRegisteredAddresses => 'Sin direcciones registradas';

  @override
  String get addNewAddress => 'Agregar Nueva Dirección';

  @override
  String get unexpectedError => 'Ocurrió un error inesperado';

  @override
  String get networkError => 'Problema de red';

  @override
  String get notFoundError => 'No encontrado';

  @override
  String get validationError => 'Error de validación';
}
