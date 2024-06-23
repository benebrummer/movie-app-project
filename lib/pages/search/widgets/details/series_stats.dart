import 'package:flutter/material.dart';

import '../../../../entity/media/series/series_details.dart';

class SeriesStats extends StatelessWidget {
  final SeriesDetails seriesDetails;

  const SeriesStats({
    super.key,
    required this.seriesDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
                'Created by: ${seriesDetails.createdBy.isEmpty ? '-' : seriesDetails.createdBy.map((e) => e.name).join(', ')}'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text('Seasons: ${seriesDetails.numberOfSeasons}'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text('Total Episodes: ${seriesDetails.numberOfEpisodes}'),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Text('In Production:'),
            const SizedBox(width: 5),
            seriesDetails.inProduction
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 5),
            Text(seriesDetails.firstAirDate),
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
                '${seriesDetails.voteAverage.toStringAsFixed(1)} / 10.0 (${seriesDetails.voteCount})'),
          ],
        ),
      ],
    );
  }
}
