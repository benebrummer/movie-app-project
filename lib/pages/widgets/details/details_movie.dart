import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/controller/images_controller.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/pages/widgets/appbar/details/movie_app_bar.dart';
import 'package:movie_app_project/pages/widgets/details/images_slider.dart';
import 'package:movie_app_project/pages/widgets/details/movie_stats.dart';
import 'package:movie_app_project/pages/widgets/details/producer_container.dart';
import 'package:movie_app_project/pages/widgets/reviews_button.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage({super.key, required this.movie});

  final Movie movie;
  final DetailsController _detailController = Get.find<DetailsController>();
  final ImagesController _imagesController = Get.find<ImagesController>();

  @override
  Widget build(BuildContext context) {
    _imagesController.getMovieImages(movie.id);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            MovieAppBar(movie: movie),
            SliverToBoxAdapter(
              child: Obx(
                () => _detailController.isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                movie.title,
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                              width: double.infinity,
                            ),
                            Center(
                              child: Text(
                                _detailController.currentMovieDetails.tagline,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                              width: double.infinity,
                            ),
                            movie.overview.isEmpty
                                ? const Center(
                                    child: Text('No overview available'))
                                : Text(movie.overview,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                            const SizedBox(height: 22),
                            MovieStatsContainer(
                              movie: _detailController.currentMovieDetails,
                            ),
                            const SizedBox(height: 5),
                            _detailController.currentMovieDetails
                                    .productionCompanies.isEmpty
                                ? const SizedBox()
                                : ProducerContainer(
                                    productionCompanies: _detailController
                                        .currentMovieDetails
                                        .productionCompanies,
                                  ),
                            const SizedBox(height: 10),
                            ImagesSlider(mediaType: MediaType.movie),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: ReviewsButton(
                                  mediaId: movie.id,
                                  mediaType: MediaType.movie,
                                  title: movie.title),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
