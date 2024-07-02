import 'package:flutter/material.dart';

import '../../../entity/media/movie/movie_details.dart';

class MovieStatsContainer extends StatelessWidget {
  final MovieDetails movie;
  const MovieStatsContainer({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.watch_later),
              const SizedBox(width: 5),
              Text('${movie.runtime} min'),
            ],
          ),
          const SizedBox(height: 5),
          Row(children: [
            const Icon(Icons.calendar_month_outlined),
            const SizedBox(width: 5),
            Text(movie.releaseDate),
          ]),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              const SizedBox(width: 5),
              Text(
                  '${movie.voteAverage.toStringAsFixed(1)}/10 (${movie.voteCount})'),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text('Original Language: ${movie.originalLanguage}'),
            ],
          )
        ],
      ),
    );
  }
}
