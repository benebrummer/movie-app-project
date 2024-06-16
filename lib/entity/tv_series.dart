class TvSeries {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  const TvSeries({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvSeries.fromJson(Map<String, dynamic> json) {
    return TvSeries(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] ?? 0,
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      name: json['name'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'TvSeries{adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originCountry: $originCountry, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, firstAirDate: $firstAirDate, name: $name, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}
