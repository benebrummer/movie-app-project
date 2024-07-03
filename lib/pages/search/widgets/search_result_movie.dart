import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/pages/widgets/details/details_movie.dart';

import '../../../controller/favorites_controller.dart';
import '../../../entity/media/movie/movie.dart';

class MovieResultItem extends StatelessWidget {
  final Movie movie;

  MovieResultItem({
    super.key,
    required this.movie,
  });

  final DetailsController _detailsController = Get.find();
  final FavoritesController _favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _detailsController.initMovieDetails(movie.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MovieDetailsPage(movie: movie);
            },
          ),
        );
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
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        width: 100,
                        height: 150,
                      ),
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _favoritesController.isMovieFavorite(movie.id)
                                  ? const Center(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
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
