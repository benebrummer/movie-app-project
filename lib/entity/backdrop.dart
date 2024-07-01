class Backdrop {
  final double aspectRatio;
  final int height;
  final String? iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  Backdrop({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Backdrop.fromJson(Map<String, dynamic> json) {
    return Backdrop(
      aspectRatio: json['aspect_ratio'] as double,
      height: json['height'] as int,
      iso6391: json['iso_639_1'],
      filePath: json['file_path'] as String,
      voteAverage: json['vote_average'] as double,
      voteCount: json['vote_count'] as int,
      width: json['width'] as int,
    );
  }
}
