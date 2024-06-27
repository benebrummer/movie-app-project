import 'package:hive/hive.dart';

part 'season.g.dart';

@HiveType(typeId: 10)
class Season {
  @HiveField(0)
  final String firstAirDate;
  @HiveField(1)
  final int episodeCount;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final String posterPath;
  @HiveField(6)
  final int seasonNumber;
  @HiveField(7)
  final int voteAverage;

  const Season({
    required this.firstAirDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      firstAirDate: json['air_date'] ?? '',
      episodeCount: json['episode_count'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      seasonNumber: json['season_number'] ?? 0,
      voteAverage: (json['vote_average'] ?? 0).toInt(),
    );
  }

  @override
  String toString() {
    return 'Season{firstAirDate: $firstAirDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage}';
  }
}
