import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/search_controller.dart';
import 'package:movie_app_project/pages/search/widgets/media_search_widget.dart';
import 'package:movie_app_project/pages/search/widgets/search_result_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final MediaSearchController controller = Get.find<MediaSearchController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MediaSearchWidget(),
        const SizedBox(height: 20),
        Obx(() {
          return controller.isSearching
              ? const CircularProgressIndicator()
              : SearchResultWidget();
        }),
      ],
    );
  }
}
