import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:movie_app_project/pages/favorites/widgets/poster_image.dart';
import 'package:movie_app_project/pages/favorites/widgets/title_text.dart';

import '../../../controller/favorites_controller.dart';
import '../../../entity/media/series/series_details.dart';
import '../../widgets/details/details_series.dart';

class FavoriteSeriesGrid extends StatelessWidget {
  FavoriteSeriesGrid({super.key});

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
        itemCount: _favoritesController.seriesCount.value,
        itemBuilder: (context, index) {
          final SeriesDetails series =
              _favoritesController.favoriteSeries[index];
          return GestureDetector(
            onTap: () {
              _detailsController.setCurrentSeriesDetails(series);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SeriesDetailsPage(
                        show: _mapSeriesDetailsToSeries(series));
                  },
                ),
              );
            },
            child: Column(
              children: [
                Obx(
                  () {
                    if (_favoritesController.offline.value) {
                      return const PosterImage(posterPath: '');
                    }
                    return PosterImage(posterPath: series.posterPath);
                  },
                ),
                TitleText(title: series.name),
              ],
            ),
          );
        },
      ),
    );
  }

  TvSeries _mapSeriesDetailsToSeries(SeriesDetails series) {
    return TvSeries(
      id: series.id,
      name: series.name,
      overview: series.overview,
      posterPath: series.posterPath,
      backdropPath: series.backdropPath,
      firstAirDate: series.firstAirDate,
      voteAverage: series.voteAverage,
      voteCount: series.voteCount,
      adult: series.adult,
      genreIds: series.genres.map((genre) => genre.id).toList(),
      originCountry: series.originCountry,
      originalLanguage: series.originalLanguage,
      popularity: series.popularity,
      originalName: series.originalName,
    );
  }
}
