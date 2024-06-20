import 'package:flutter/material.dart';
import 'package:movie_app_project/entity/movie.dart';

class SearchResultItem extends StatelessWidget {
  final Movie movie;
  const SearchResultItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.image),
              Text(movie.title),
            ],
          ),
          const Text('OVERVIEW'),
        ],
      ),
    );
  }
}
