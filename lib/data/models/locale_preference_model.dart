import 'package:hive/hive.dart';

part 'locale_preference_model.g.dart';

@HiveType(typeId: 3)
class LocalePreferenceModel extends HiveObject {
  @HiveField(0)
  final String localeCode; // 'en'|'es'|'system'

  LocalePreferenceModel(this.localeCode);
}
