import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/drawer/drawer.dart';
import 'package:movie_app_project/pages/favorites/widgets/favorite_movie_grid.dart';
import 'package:movie_app_project/pages/favorites/widgets/favorite_series_grid.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => _favoritesController.selectedMediaTypes[0]
                  ? FavoriteMovieGrid()
                  : FavoriteSeriesGrid()),
            ),
          ),
        ],
      ),
    );
  }
}
