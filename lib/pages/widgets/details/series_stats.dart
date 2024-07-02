import 'package:flutter/material.dart';
import 'package:movie_app_project/entity/media/series/series_details.dart';

class SeriesStatsContainer extends StatelessWidget {
  final SeriesDetails show;
  const SeriesStatsContainer({super.key, required this.show});

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
              const Icon(Icons.calendar_today),
              const SizedBox(width: 5),
              Text(show.firstAirDate),
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
                  '${show.voteAverage.toStringAsFixed(1)}/10 (${show.voteCount})'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Text('Seasons:'),
              const SizedBox(width: 5),
              Text('${show.numberOfSeasons}'),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text('Episodes:'),
              const SizedBox(width: 5),
              Text('${show.numberOfEpisodes}'),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text('In production:'),
              const SizedBox(width: 5),
              show.inProduction
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.close, color: Colors.red),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text('Original Language: ${show.originalLanguage}'),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                  'Created by: ${show.createdBy.isEmpty ? '-' : show.createdBy.map((e) => e.name).join(', ')}'),
            ],
          ),
        ],
      ),
    );
  }
}
