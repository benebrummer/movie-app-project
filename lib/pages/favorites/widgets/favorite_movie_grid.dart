import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/pages/favorites/widgets/poster_image.dart';
import 'package:movie_app_project/pages/favorites/widgets/title_text.dart';
import 'package:movie_app_project/pages/widgets/details/details_movie.dart';

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
          childAspectRatio: 0.55,
        ),
        itemCount: _favoritesController.movieCount.value,
        itemBuilder: (context, index) {
          final MovieDetails movie = _favoritesController.favoriteMovies[index];
          return GestureDetector(
            onTap: () {
              _detailsController.setCurrentMovieDetails(movie);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MovieDetailsPage(
                        movie: _mapMovieDetailsToMovie(movie));
                  },
                ),
              );
            },
            child: Column(
              children: [
                PosterImage(posterPath: movie.posterPath),
                TitleText(title: movie.title),
              ],
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
