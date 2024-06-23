import 'dart:core';

import 'package:movie_app_project/entity/media/collection.dart';
import 'package:movie_app_project/entity/media/language.dart';

import '../genre.dart';
import '../production_company.dart';
import '../production_country.dart';

class MovieDetails {
  final bool adult;
  final String backdropPath;
  final Collection belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<Language> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetails({
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
