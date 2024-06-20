import 'package:flutter/material.dart';
import 'package:movie_app_project/entity/movie.dart';

class SearchResultItem extends StatelessWidget {
  final String posterPath;
  final String title;
  final String releaseDate;
  const SearchResultItem({super.key, required this.posterPath, required this.title, required this.releaseDate,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                posterPath.isEmpty ? Icon(Icons.image, size: 50,) :
                Image.network('https://image.tmdb.org/t/p/original$posterPath', height: 150, width: 100),
                const SizedBox(width: 30,),
                Text(title, style: TextStyle(fontSize: 20),),
              ],
            ),
            Text(releaseDate),
          ],
        ),
      ),
    );
  }
}
