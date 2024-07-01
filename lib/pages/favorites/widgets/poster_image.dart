import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  final String posterPath;
  const PosterImage({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: posterPath.isEmpty
          ? const Icon(
              Icons.movie,
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
