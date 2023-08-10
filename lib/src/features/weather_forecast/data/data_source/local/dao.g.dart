// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalLocationDAOAdapter extends TypeAdapter<LocalLocationDAO> {
  @override
  final int typeId = 0;

  @override
  LocalLocationDAO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalLocationDAO(
      name: fields[0] as String,
      icon: fields[1] as String?,
      latitude: fields[2] as num,
      longitude: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, LocalLocationDAO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalLocationDAOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
