import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/drawer/drawer.dart';
import 'package:movie_app_project/entity/media/series/series_details.dart';

import '../../entity/media/movie/movie_details.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final FavoritesController _favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      drawer: MovieAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Obx(
              () {
                return ToggleButtons(
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                    minWidth: 100.0,
                  ),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  onPressed: (int index) {
                    _favoritesController.updateMediaType(index);
                  },
                  isSelected: _favoritesController.selectedMediaTypes,
                  children: List.of(
                      {const Text('Movies'), const Text('TV Shows')},
                      growable: false),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              // TODO: refactor this to use a single ListView.builder or split in two widgets
              () => _favoritesController.selectedMediaTypes[0]
                  ? ListView.builder(
                      itemCount: _favoritesController.movieCount.value,
                      itemBuilder: (context, index) {
                        final MovieDetails movie =
                            _favoritesController.favoriteMovies[index];
                        return ListTile(
                          title: Text(movie.title),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: _favoritesController.seriesCount.value,
                      itemBuilder: (context, index) {
                        final SeriesDetails series =
                            _favoritesController.favoriteSeries[index];
                        return ListTile(
                          title: Text(series.name),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
