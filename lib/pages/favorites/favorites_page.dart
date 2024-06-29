import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/drawer/drawer.dart';

import '../../entity/media/movie/movie_details.dart';
import '../../entity/media/series/series_details.dart';

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
              child: Obx(
                // TODO: refactor this to use a single ListView.builder or split in two widgets
                () => _favoritesController.selectedMediaTypes[0]
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: _favoritesController.movieCount.value,
                        itemBuilder: (context, index) {
                          final MovieDetails movie =
                              _favoritesController.favoriteMovies[index];
                          return movie.posterPath.isEmpty
                              ? const Icon(Icons.movie)
                              : SizedBox(
                                  height: 250,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
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
                                            movie.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                              : SizedBox(
                                  height: 250,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
