import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';

class SeriesAppBar extends StatelessWidget {
  final TvSeries series;
  SeriesAppBar({super.key, required this.series});

  final DetailsController _detailsController = Get.find();
  final FavoritesController _favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.only(
          top: 14,
          left: 14,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Obx(
            () => Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(
                top: 14,
                left: 14,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  String message = '';
                  if (_detailsController.isFavorite) {
                    _favoritesController.removeFavoriteSeries(series.id);
                    _detailsController.toggleFavorite();
                    message = 'Removed from favorites';
                  } else {
                    _favoritesController.addFavoriteSeries(series.id);
                    _detailsController.toggleFavorite();
                    message = 'Added to favorites';
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                icon: Icon(
                  _detailsController.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
      pinned: true,
      floating: true,
      expandedHeight: 180,
      collapsedHeight: 70,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://image.tmdb.org/t/p/w500${series.backdropPath}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
