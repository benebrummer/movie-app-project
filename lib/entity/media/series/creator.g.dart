// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreatorAdapter extends TypeAdapter<Creator> {
  @override
  final int typeId = 7;

  @override
  Creator read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Creator(
      id: fields[0] as int,
      creditId: fields[1] as String,
      name: fields[2] as String,
      gender: fields[3] as int,
      profilePath: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Creator obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creditId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
