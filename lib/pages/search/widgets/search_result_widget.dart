import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/search_controller.dart';
import 'package:movie_app_project/pages/search/widgets/search_result_movie.dart';
import 'package:movie_app_project/pages/search/widgets/search_result_series.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../../entity/media/movie/movie.dart';
import '../../../../entity/media/series/tv_series.dart';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({super.key});
  final MediaSearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (controller.resultCount == 0 &&
              controller.searchQuery.isNotEmpty) {
            return const Center(
              child: Text(
                'No results found',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.resultCount + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == controller.resultCount) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Visibility(
                    visible: controller.currentPage < controller.totalPages,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.loadMoreResults();
                      },
                      child: const Text(
                        'Find more',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (controller.selectedMediaType == MediaType.movie) {
                final Movie movie = controller.movieSearchResults[index];
                return _createSearchResultMovie(movie);
              }
              final TvSeries series = controller.seriesSearchResults[index];
              return _createSearchResultSeries(series);
            },
          );
        },
      ),
    );
  }

  Widget _createSearchResultMovie(final Movie movie) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MovieResultItem(
        movie: movie,
      ),
    );
  }

  Widget _createSearchResultSeries(final TvSeries series) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SeriesResultItem(
        series: series,
      ),
    );
  }
}
