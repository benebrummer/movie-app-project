import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/search_controller.dart';
import 'package:movie_app_project/pages/search/widgets/search/media_search_widget.dart';
import 'package:movie_app_project/pages/search/widgets/search/search_result_widget.dart';
import 'package:movie_app_project/pages/widgets/appbar/app_bar.dart';

import '../../drawer/drawer.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final MediaSearchController controller = Get.find<MediaSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MovieAppDrawer(),
      appBar: const TmdbAppBar(title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MediaSearchWidget(),
              const SizedBox(height: 20),
              Obx(() {
                return controller.isSearching
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SearchResultWidget();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
