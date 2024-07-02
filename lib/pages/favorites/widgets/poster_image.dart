import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  final String posterPath;
  const PosterImage({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: posterPath.isEmpty
          ? Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: const Icon(
                Icons.movie,
                size: 40,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500$posterPath',
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
