import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/pages/browse/widgets/browse_details_movie.dart';

import '../../../entity/media/movie/movie_details.dart';

class FavoriteMovieGrid extends StatelessWidget {
  FavoriteMovieGrid({super.key});

  final FavoritesController _favoritesController = Get.find();
  final DetailsController _detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.6,
        ),
        itemCount: _favoritesController.movieCount.value,
        itemBuilder: (context, index) {
          final MovieDetails movie = _favoritesController.favoriteMovies[index];
          return movie.posterPath.isEmpty
              ? const Icon(Icons.movie)
              : GestureDetector(
                  onTap: () {
                    _detailsController.setCurrentMovieDetails(movie);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BrowseDetailsMovie(
                              movie: _mapMovieDetailsToMovie(movie));
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 250,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 5.0,
                            ),
                            child: Text(
                              movie.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Movie _mapMovieDetailsToMovie(final MovieDetails movieDetails) {
    return Movie(
      adult: movieDetails.adult,
      backdropPath: movieDetails.backdropPath,
      id: movieDetails.id,
      originalLanguage: movieDetails.originalLanguage,
      originalTitle: movieDetails.originalTitle,
      overview: movieDetails.overview,
      popularity: movieDetails.popularity,
      posterPath: movieDetails.posterPath,
      releaseDate: movieDetails.releaseDate,
      title: movieDetails.title,
      video: movieDetails.video,
      voteAverage: movieDetails.voteAverage,
      voteCount: movieDetails.voteCount,
    );
  }
}
