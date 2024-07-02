import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/browse_controller.dart';
import '../../../controller/details_controller.dart';
import '../../../entity/media/movie/movie.dart';
import '../../../entity/media/series/tv_series.dart';
import '../../favorites/widgets/poster_image.dart';
import '../../widgets/details/details_movie.dart';
import '../../widgets/details/details_series.dart';

class NowPlayingSlider extends StatelessWidget {
  NowPlayingSlider({super.key});

  final BrowseController controller = Get.find<BrowseController>();
  final DetailsController _detailsController = Get.find<DetailsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Obx(
        () {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.resultCountNowPlaying,
            itemBuilder: (BuildContext context, int index) {
              if (controller.selectedCategory == BrowseCategory.movies) {
                final Movie movie = controller.movieNowPlayingResults[index];
                return GestureDetector(
                  onTap: () {
                    _detailsController.initMovieDetails(movie.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailsPage(movie: movie)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          PosterImage(posterPath: movie.posterPath),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 8.0, right: 8.0),
                            child: Text(
                              movie.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                final TvSeries tvSeries =
                    controller.seriesOnTheAirResults[index];
                return GestureDetector(
                  onTap: () {
                    _detailsController.initSeriesDetails(tvSeries.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SeriesDetailsPage(show: tvSeries)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          PosterImage(posterPath: tvSeries.posterPath),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 8.0, right: 8.0),
                            child: Text(
                              tvSeries.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
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
