import 'package:hive/hive.dart';

part 'episode.g.dart';

@HiveType(typeId: 8)
class Episode {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final double voteAverage;
  @HiveField(4)
  final int voteCount;
  @HiveField(5)
  final String airDate;
  @HiveField(6)
  final int episodeNumber;
  @HiveField(7)
  final String productionCode;
  @HiveField(8)
  final int runtime;
  @HiveField(9)
  final int seasonNumber;
  @HiveField(10)
  final int showId;
  @HiveField(11)
  final String stillPath;

  Episode({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      voteAverage: json['vote_average'] ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      airDate: json['air_date'] ?? '',
      episodeNumber: json['episode_number'] ?? 0,
      productionCode: json['production_code'] ?? '',
      runtime: json['runtime'] ?? 0,
      seasonNumber: json['season_number'] ?? 0,
      showId: json['show_id'] ?? 0,
      stillPath: json['still_path'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Episode{id: $id, name: $name, overview: $overview, voteAverage: $voteAverage, voteCount: $voteCount, airDate: $airDate, episodeNumber: $episodeNumber, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath}';
  }
}
