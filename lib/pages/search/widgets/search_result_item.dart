import 'package:flutter/material.dart';
import 'package:movie_app_project/entity/movie.dart';

class SearchResultItem extends StatelessWidget {
  final String posterPath;
  final String title;
  final String releaseDate;

  const SearchResultItem({
    super.key,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                posterPath.isEmpty
                    ? const Icon(
                        Icons.image,
                        size: 50,
                      )
                    : Image.network(
                        'https://image.tmdb.org/t/p/original$posterPath',
                        height: 150,
                        width: 100,
                      ),
                const Spacer(),
                Text(
                  releaseDate,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
