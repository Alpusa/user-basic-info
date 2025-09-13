import 'package:hive/hive.dart';

part 'theme_preference_model.g.dart';

@HiveType(typeId: 2)
class ThemePreferenceModel extends HiveObject {
  @HiveField(0)
  final String mode; // 'light'|'dark'|'system'

  ThemePreferenceModel(this.mode);
}
