import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/search_controller.dart';
import 'package:movie_app_project/pages/search/widgets/search_result_item.dart';

import '../../../entity/movie.dart';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({super.key});

  final MediaSearchController controller = Get.find<MediaSearchController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final Movie movie = controller.searchResults[index];
          return SearchResultItem(movie: movie);
        },
        itemCount: controller.searchResults.length,
      ),
    );
  }
}
