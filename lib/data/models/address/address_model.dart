import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
@HiveType(typeId: 1)
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String pais,
    @HiveField(3) required String departamento,
    @HiveField(4) required String municipio,
    @HiveField(5) required String direccion,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
