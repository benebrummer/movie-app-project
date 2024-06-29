import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';

import '../../../controller/favorites_controller.dart';
import '../../../entity/media/series/series_details.dart';
import '../../browse/widgets/browse_details_series.dart';

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
          childAspectRatio: 0.6,
        ),
        itemCount: _favoritesController.seriesCount.value,
        itemBuilder: (context, index) {
          final SeriesDetails series =
              _favoritesController.favoriteSeries[index];
          return series.posterPath.isEmpty
              ? const Icon(Icons.movie)
              : GestureDetector(
                  onTap: () {
                    _detailsController.setCurrentSeriesDetails(series);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BrowseDetailsSeries(
                              show: _mapSeriesDetailsToSeries(series));
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
                              'https://image.tmdb.org/t/p/w500${series.posterPath}',
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
                              series.name,
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
