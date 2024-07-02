import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/controller/review_controller.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../reviews/reviews_page.dart';

class SeriesAppBar extends StatelessWidget {
  final TvSeries series;
  SeriesAppBar({super.key, required this.series});

  final DetailsController _detailsController = Get.find();
  final FavoritesController _favoritesController = Get.find();
  final ReviewController _reviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(
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
        Obx(
          () => Container(
            margin: const EdgeInsets.only(
              top: 14,
              right: 14,
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
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 14,
            right: 14,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {
              _reviewController.fetchReviews(series.id, MediaType.tv);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewsPage(title: series.name),
                ),
              );
            },
            icon: Icon(Icons.comment,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
      pinned: true,
      floating: true,
      expandedHeight: 180,
      collapsedHeight: 70,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: series.backdropPath.isEmpty
            ? null
            : Image.network(
                'https://image.tmdb.org/t/p/w500${series.backdropPath}',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
