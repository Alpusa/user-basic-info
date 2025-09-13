// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'User Basic Info';

  @override
  String get navUsers => 'Users';

  @override
  String get navAddresses => 'Addresses';

  @override
  String get navSettings => 'Settings';

  @override
  String get loading => 'Loading...';

  @override
  String get loadingUsers => 'Loading users...';

  @override
  String get loadingAddresses => 'Loading addresses...';

  @override
  String get loadingUser => 'Loading user...';

  @override
  String get deletingUsers => 'Deleting users...';

  @override
  String get deletingAddresses => 'Deleting addresses...';

  @override
  String get loadingCountries => 'Loading countries...';

  @override
  String get refresh => 'Refresh';

  @override
  String get clear => 'Clear';

  @override
  String get createUser => 'Create user';

  @override
  String get edit => 'Edit';

  @override
  String get editAccount => 'Edit account';

  @override
  String get editAddress => 'Edit address';

  @override
  String get delete => 'Delete';

  @override
  String get deleteUser => 'Delete user';

  @override
  String get deleteAddress => 'Delete address';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirmDeleteAddress => 'Do you want to delete this address?';

  @override
  String get confirmDeleteUser =>
      'This will delete the user and their addresses. Continue?';

  @override
  String get users => 'Users';

  @override
  String get addresses => 'Addresses';

  @override
  String get settings => 'Settings';

  @override
  String get searchUsers => 'Search users';

  @override
  String get searchAddresses => 'Search addresses';

  @override
  String get noUsers => 'No users';

  @override
  String get noAddresses => 'No addresses';

  @override
  String get invalidAddressId => 'Invalid address ID';

  @override
  String get addressDeleted => 'Address deleted';

  @override
  String get totalUsers => 'Total users';

  @override
  String get totalAddresses => 'Total addresses';

  @override
  String get deleteAllUsers => 'Delete all users';

  @override
  String get deleteAllAddresses => 'Delete all addresses';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get languageSystem => 'System';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'English';

  @override
  String get savedSuccessfully => 'Saved successfully';

  @override
  String get saving => 'Saving...';

  @override
  String get next => 'Next';

  @override
  String get save => 'Save';

  @override
  String get createAccount => 'Create account';

  @override
  String get createAddress => 'Create address';

  @override
  String get firstName => 'First name';

  @override
  String get lastName => 'Last name';

  @override
  String get birthDate => 'Birth date';

  @override
  String get birthDateHint => 'DD/MM/YYYY';

  @override
  String get invalidDate => 'Invalid date';

  @override
  String get requiredField => 'Required field';

  @override
  String get enterFirstName => 'Enter your first name';

  @override
  String get enterLastName => 'Enter your last name';

  @override
  String get country => 'Country';

  @override
  String get state => 'State/Province';

  @override
  String get city => 'City/Municipality';

  @override
  String get selectCountry => 'Select a country';

  @override
  String get selectState => 'Select a state/province';

  @override
  String get selectCity => 'Select a city/municipality';

  @override
  String get address => 'Address';

  @override
  String get enterAddress => 'Enter the address';

  @override
  String get userSummary => 'User Summary';

  @override
  String get userNotFound => 'User not found';

  @override
  String get id => 'ID';

  @override
  String birthDatePrefix(Object date) {
    return 'Birth date: $date';
  }

  @override
  String get registeredAddresses => 'Registered Addresses';

  @override
  String get noRegisteredAddresses => 'No registered addresses';

  @override
  String get addNewAddress => 'Add New Address';

  @override
  String get unexpectedError => 'An unexpected error occurred';

  @override
  String get networkError => 'Network problem';

  @override
  String get notFoundError => 'Not found';

  @override
  String get validationError => 'Validation error';
}
