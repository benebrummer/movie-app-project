import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/search_controller.dart';
import 'package:movie_app_project/pages/search/widgets/search_result_item.dart';

import '../../../entity/movie.dart';
import '../../../entity/tv_series.dart';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({super.key});

  final MediaSearchController controller = Get.find<MediaSearchController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // TODO: keep items alive to prevent reloading images?
        itemBuilder: (BuildContext context, int index) {
          if (controller.selectedCategory == SearchCategory.movies) {
            final Movie movie = controller.movieSearchResults[index];
            return SearchResultItem(posterPath: movie.posterPath, title: movie.title, releaseDate: movie.releaseDate,);
          }
          final TvSeries series = controller.seriesSearchResults[index];
          return SearchResultItem(posterPath: series.posterPath, title: series.name, releaseDate: series.firstAirDate,);
        },
        itemCount: controller.movieSearchResults.length,
      ),
    );
  }
}
