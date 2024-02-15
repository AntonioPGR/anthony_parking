// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarModelAdapter extends TypeAdapter<CarModel> {
  @override
  final int typeId = 0;

  @override
  CarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarModel(
      plate: fields[0] as String,
      model: fields[1] as String?,
      entry_time: fields[2] as DateTime,
      secret: fields[3] as String?,
      photo: fields[5] as String?,
      color: fields[4] as String?,
      uuid: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CarModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.plate)
      ..writeByte(1)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.entry_time)
      ..writeByte(3)
      ..write(obj.secret)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.photo)
      ..writeByte(6)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
