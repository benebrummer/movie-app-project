import 'package:flutter/material.dart';
import 'package:movie_app_project/entity/media/movie/movie_details.dart';

class MovieStats extends StatelessWidget {
  final MovieDetails movieDetails;

  const MovieStats({
    super.key,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.timer),
            const SizedBox(width: 5),
            Text('${movieDetails.runtime} min'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 5),
            Text(movieDetails.releaseDate),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const SizedBox(width: 5),
            Text(
                '${movieDetails.voteAverage.toStringAsFixed(1)} / 10.0 (${movieDetails.voteCount})'),
          ],
        ),
      ],
    );
  }
}
