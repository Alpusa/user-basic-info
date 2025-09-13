import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@HiveType(typeId: 0)
class UserModel with _$UserModel {
  const factory UserModel({
    @HiveField(0) required String nombre,
    @HiveField(1) required String apellido,
    @HiveField(2) required DateTime fechaNacimiento,
    @HiveField(3) required String id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
