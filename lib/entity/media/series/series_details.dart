import 'package:hive/hive.dart';
import 'package:movie_app_project/entity/media/series/season.dart';

import '../genre.dart';
import '../language.dart';
import '../production_company.dart';
import '../production_country.dart';
import 'creator.dart';
import 'episode.dart';
import 'network.dart';

part 'series_details.g.dart';

@HiveType(typeId: 6)
class SeriesDetails {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String backdropPath;
  @HiveField(2)
  final List<Creator> createdBy;
  @HiveField(3)
  final List<int> episodeRunTime;
  @HiveField(4)
  final String firstAirDate;
  @HiveField(5)
  final List<Genre> genres;
  @HiveField(6)
  final String homepage;
  @HiveField(7)
  final int id;
  @HiveField(8)
  final bool inProduction;
  @HiveField(9)
  final List<String> languages;
  @HiveField(10)
  final String lastAirDate;
  @HiveField(11)
  final Episode lastEpisodeToAir;
  @HiveField(12)
  final String name;
  @HiveField(13)
  final Episode? nextEpisodeToAir;
  @HiveField(14)
  final List<Network> networks;
  @HiveField(15)
  final int numberOfEpisodes;
  @HiveField(16)
  final int numberOfSeasons;
  @HiveField(17)
  final List<String> originCountry;
  @HiveField(18)
  final String originalLanguage;
  @HiveField(19)
  final String originalName;
  @HiveField(20)
  final String overview;
  @HiveField(21)
  final double popularity;
  @HiveField(22)
  final String posterPath;
  @HiveField(23)
  final List<ProductionCompany> productionCompanies;
  @HiveField(24)
  final List<ProductionCountry> productionCountries;
  @HiveField(25)
  final List<Season> seasons;
  @HiveField(26)
  final List<Language> spokenLanguages;
  @HiveField(27)
  final String status;
  @HiveField(28)
  final String tagline;
  @HiveField(29)
  final String type;
  @HiveField(30)
  final double voteAverage;
  @HiveField(31)
  final int voteCount;

  SeriesDetails({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SeriesDetails.fromJson(Map<dynamic, dynamic> json) {
    return SeriesDetails(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      createdBy: (json['created_by'] as List<dynamic>)
          .map((e) => Creator.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: (json['episode_run_time'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      firstAirDate: json['first_air_date'] ?? '',
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] ?? '',
      id: json['id'] ?? 0,
      inProduction: json['in_production'] ?? false,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      lastAirDate: json['last_air_date'] ?? '',
      lastEpisodeToAir: Episode.fromJson(json['last_episode_to_air']),
      name: json['name'] ?? '',
      nextEpisodeToAir: json['next_episode_to_air'] != null
          ? Episode.fromJson(json['next_episode_to_air'])
          : null,
      networks: (json['networks'] as List<dynamic>)
          .map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: json['number_of_episodes'] ?? 0,
      numberOfSeasons: json['number_of_seasons'] ?? 0,
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'] ?? '',
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      type: json['type'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
