import 'package:flutter/material.dart';

class DetailsHeaderWidget extends StatelessWidget {
  final String posterPath;
  final String title;
  final String tagline;
  const DetailsHeaderWidget({
    super.key,
    required this.posterPath,
    required this.title,
    required this.tagline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        posterPath.isEmpty
            ? const SizedBox(
                width: 250,
                height: 375,
                child: Icon(Icons.image),
              )
            : Image.network(
                'https://image.tmdb.org/t/p/w500$posterPath',
                width: 250,
                height: 375,
                fit: BoxFit.cover,
              ),
        const SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(textAlign: TextAlign.center, tagline),
      ],
    );
  }
}
