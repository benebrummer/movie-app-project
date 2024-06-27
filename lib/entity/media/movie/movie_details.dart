import 'dart:core';

import 'package:hive/hive.dart';
import 'package:movie_app_project/entity/media/collection.dart';
import 'package:movie_app_project/entity/media/language.dart';

import '../genre.dart';
import '../production_company.dart';
import '../production_country.dart';

part 'movie_details.g.dart';

@HiveType(typeId: 0)
class MovieDetails extends HiveObject {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String backdropPath;
  @HiveField(2)
  final Collection belongsToCollection;
  @HiveField(3)
  final int budget;
  @HiveField(4)
  final List<Genre> genres;
  @HiveField(5)
  final String homepage;
  @HiveField(6)
  final int id;
  @HiveField(7)
  final String imdbId;
  @HiveField(8)
  final String originalLanguage;
  @HiveField(9)
  final String originalTitle;
  @HiveField(10)
  final String overview;
  @HiveField(11)
  final double popularity;
  @HiveField(12)
  final String posterPath;
  @HiveField(13)
  final List<ProductionCompany> productionCompanies;
  @HiveField(14)
  final List<ProductionCountry> productionCountries;
  @HiveField(15)
  final String releaseDate;
  @HiveField(16)
  final int revenue;
  @HiveField(17)
  final int runtime;
  @HiveField(18)
  final List<Language> spokenLanguages;
  @HiveField(19)
  final String status;
  @HiveField(20)
  final String tagline;
  @HiveField(21)
  final String title;
  @HiveField(22)
  final bool video;
  @HiveField(23)
  final double voteAverage;
  @HiveField(24)
  final int voteCount;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetails.fromJson(Map<dynamic, dynamic> json) {
    return MovieDetails(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      belongsToCollection:
          Collection.fromJson(json['belongs_to_collection'] ?? {}),
      budget: json['budget'] ?? 0,
      genres: json['genres'] != null
          ? (json['genres'] as List<dynamic>)
              .map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      homepage: json['homepage'] ?? '',
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'] ?? '',
      productionCompanies: json['production_companies'] != null
          ? (json['production_companies'] as List<dynamic>)
              .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      productionCountries: json['production_countries'] != null
          ? (json['production_countries'] as List<dynamic>)
              .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      releaseDate: json['release_date'] ?? '',
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      spokenLanguages: json['spoken_languages'] != null
          ? (json['spoken_languages'] as List<dynamic>)
              .map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'MovieDetails{adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}
