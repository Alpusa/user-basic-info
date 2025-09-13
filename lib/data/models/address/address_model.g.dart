// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final int typeId = 1;

  @override
  AddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      pais: fields[2] as String,
      departamento: fields[3] as String,
      municipio: fields[4] as String,
      direccion: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.pais)
      ..writeByte(3)
      ..write(obj.departamento)
      ..writeByte(4)
      ..write(obj.municipio)
      ..writeByte(5)
      ..write(obj.direccion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      pais: json['pais'] as String,
      departamento: json['departamento'] as String,
      municipio: json['municipio'] as String,
      direccion: json['direccion'] as String,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'pais': instance.pais,
      'departamento': instance.departamento,
      'municipio': instance.municipio,
      'direccion': instance.direccion,
    };
