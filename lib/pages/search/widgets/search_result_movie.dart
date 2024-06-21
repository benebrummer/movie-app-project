import 'package:flutter/material.dart';

import '../../../entity/movie.dart';

class MovieResultItem extends StatelessWidget {
  final Movie movie;

  const MovieResultItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement navigation to movie details page. Maybe use Details endpoint.
        print('Tapped: ${movie.title}');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              movie.posterPath.isEmpty
                  ? const SizedBox(
                      width: 100,
                      height: 150,
                      child: Icon(Icons.image),
                    )
                  : Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: 100,
                      height: 150,
                    ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      movie.overview,
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
                          '${movie.voteAverage.toStringAsFixed(1)} / 10.0',
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
                          movie.releaseDate,
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
