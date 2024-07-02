import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/browse_controller.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:movie_app_project/pages/browse/widgets/browse_details_movie.dart';
import 'package:movie_app_project/pages/browse/widgets/browse_details_series.dart';
import 'package:movie_app_project/pages/favorites/widgets/poster_image.dart';

class TrendingSlider extends StatelessWidget {
  TrendingSlider({super.key});

  final BrowseController controller = Get.find<BrowseController>();
  final DetailsController _detailsController = Get.find<DetailsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Obx(
        () {
          if (controller.resultCountPopular == 0) {
            return const SizedBox();
          }
          return CarouselSlider.builder(
            itemCount: controller.resultCountPopular,
            options: CarouselOptions(
                height: 400,
                autoPlay: true,
                viewportFraction: 0.55,
                enlargeCenterPage: true,
                pageSnapping: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1)),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              if (controller.selectedCategory == BrowseCategory.movies) {
                final Movie movie = controller.moviePopularResults[itemIndex];
                return GestureDetector(
                  onTap: () {
                    _detailsController.initMovieDetails(movie.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BrowseDetailsMovie(movie: movie),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      PosterImage(posterPath: movie.posterPath),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 8.0, right: 8.0),
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                final TvSeries tvSeries =
                    controller.seriesPopularResults[itemIndex];
                return GestureDetector(
                  onTap: () {
                    _detailsController.initSeriesDetails(tvSeries.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BrowseDetailsSeries(show: tvSeries)));
                  },
                  child: Column(
                    children: [
                      PosterImage(posterPath: tvSeries.posterPath),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 8.0, right: 8.0),
                        child: Text(
                          tvSeries.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
