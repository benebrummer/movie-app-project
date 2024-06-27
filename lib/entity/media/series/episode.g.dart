// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeAdapter extends TypeAdapter<Episode> {
  @override
  final int typeId = 8;

  @override
  Episode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Episode(
      id: fields[0] as int,
      name: fields[1] as String,
      overview: fields[2] as String,
      voteAverage: fields[3] as double,
      voteCount: fields[4] as int,
      airDate: fields[5] as String,
      episodeNumber: fields[6] as int,
      productionCode: fields[7] as String,
      runtime: fields[8] as int,
      seasonNumber: fields[9] as int,
      showId: fields[10] as int,
      stillPath: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Episode obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.voteAverage)
      ..writeByte(4)
      ..write(obj.voteCount)
      ..writeByte(5)
      ..write(obj.airDate)
      ..writeByte(6)
      ..write(obj.episodeNumber)
      ..writeByte(7)
      ..write(obj.productionCode)
      ..writeByte(8)
      ..write(obj.runtime)
      ..writeByte(9)
      ..write(obj.seasonNumber)
      ..writeByte(10)
      ..write(obj.showId)
      ..writeByte(11)
      ..write(obj.stillPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
