// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriesDetailsAdapter extends TypeAdapter<SeriesDetails> {
  @override
  final int typeId = 6;

  @override
  SeriesDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesDetails(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String,
      createdBy: (fields[2] as List).cast<Creator>(),
      episodeRunTime: (fields[3] as List).cast<int>(),
      firstAirDate: fields[4] as String,
      genres: (fields[5] as List).cast<Genre>(),
      homepage: fields[6] as String,
      id: fields[7] as int,
      inProduction: fields[8] as bool,
      languages: (fields[9] as List).cast<String>(),
      lastAirDate: fields[10] as String,
      lastEpisodeToAir: fields[11] as Episode,
      name: fields[12] as String,
      nextEpisodeToAir: fields[13] as Episode?,
      networks: (fields[14] as List).cast<Network>(),
      numberOfEpisodes: fields[15] as int,
      numberOfSeasons: fields[16] as int,
      originCountry: (fields[17] as List).cast<String>(),
      originalLanguage: fields[18] as String,
      originalName: fields[19] as String,
      overview: fields[20] as String,
      popularity: fields[21] as double,
      posterPath: fields[22] as String,
      productionCompanies: (fields[23] as List).cast<ProductionCompany>(),
      productionCountries: (fields[24] as List).cast<ProductionCountry>(),
      seasons: (fields[25] as List).cast<Season>(),
      spokenLanguages: (fields[26] as List).cast<Language>(),
      status: fields[27] as String,
      tagline: fields[28] as String,
      type: fields[29] as String,
      voteAverage: fields[30] as double,
      voteCount: fields[31] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SeriesDetails obj) {
    writer
      ..writeByte(32)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.createdBy)
      ..writeByte(3)
      ..write(obj.episodeRunTime)
      ..writeByte(4)
      ..write(obj.firstAirDate)
      ..writeByte(5)
      ..write(obj.genres)
      ..writeByte(6)
      ..write(obj.homepage)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.inProduction)
      ..writeByte(9)
      ..write(obj.languages)
      ..writeByte(10)
      ..write(obj.lastAirDate)
      ..writeByte(11)
      ..write(obj.lastEpisodeToAir)
      ..writeByte(12)
      ..write(obj.name)
      ..writeByte(13)
      ..write(obj.nextEpisodeToAir)
      ..writeByte(14)
      ..write(obj.networks)
      ..writeByte(15)
      ..write(obj.numberOfEpisodes)
      ..writeByte(16)
      ..write(obj.numberOfSeasons)
      ..writeByte(17)
      ..write(obj.originCountry)
      ..writeByte(18)
      ..write(obj.originalLanguage)
      ..writeByte(19)
      ..write(obj.originalName)
      ..writeByte(20)
      ..write(obj.overview)
      ..writeByte(21)
      ..write(obj.popularity)
      ..writeByte(22)
      ..write(obj.posterPath)
      ..writeByte(23)
      ..write(obj.productionCompanies)
      ..writeByte(24)
      ..write(obj.productionCountries)
      ..writeByte(25)
      ..write(obj.seasons)
      ..writeByte(26)
      ..write(obj.spokenLanguages)
      ..writeByte(27)
      ..write(obj.status)
      ..writeByte(28)
      ..write(obj.tagline)
      ..writeByte(29)
      ..write(obj.type)
      ..writeByte(30)
      ..write(obj.voteAverage)
      ..writeByte(31)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
