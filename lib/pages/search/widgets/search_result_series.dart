import 'package:flutter/material.dart';

import '../../../entity/tv_series.dart';

class SeriesResultItem extends StatelessWidget {
  final TvSeries series;

  const SeriesResultItem({
    super.key,
    required this.series,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement navigation to series details page. Maybe use Details endpoint.
        print('Tapped: ${series.name}');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              series.posterPath.isEmpty
                  ? const SizedBox(
                      width: 100,
                      height: 150,
                      child: Icon(Icons.image),
                    )
                  : Image.network(
                      'https://image.tmdb.org/t/p/w500${series.posterPath}',
                      width: 100,
                      height: 150,
                    ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      series.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      series.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${series.voteAverage.toStringAsFixed(1)} / 10.0',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          series.firstAirDate,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
