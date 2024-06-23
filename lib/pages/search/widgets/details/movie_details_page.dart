import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/pages/search/widgets/details/details_card.dart';
import 'package:movie_app_project/pages/search/widgets/details/movie_stats.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../../entity/media/movie/movie.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;
  MovieDetailsPage({
    super.key,
    required this.movie,
  });
  // TODO: support opening trailer on youtube (get videos endpoint)?
  // TODO: similar movies / recommendations below (endpoints provided)?
  // TODO: provide images (get images endpoint)?
  // TODO: provide details about genres (genre ids in details)?

  final DetailsController _detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    _detailsController.initMovieDetails(movie.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SafeArea(
        child: Obx(
          () {
            return _detailsController.isLoading
                ? const Card(
                    margin: EdgeInsets.all(20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : DetailsCard(
                    title: movie.title,
                    mediaType: MediaType.movie,
                    overview: movie.overview,
                    statsWidget: MovieStats(
                      movieDetails: _detailsController.currentMovieDetails,
                    ),
                    producerCompanies: _detailsController
                        .currentMovieDetails.productionCompanies,
                    posterPath: movie.posterPath,
                    tagline: _detailsController.currentMovieDetails.tagline,
                  );
          },
        ),
      ),
    );
  }
}
