import 'package:get/get.dart';

import '../entity/media/movie/movie_details.dart';
import '../entity/media/series/series_details.dart';
import '../persistence/favorites_repository.dart';

class FavoritesController extends GetxController {
  final FavoritesRepository _favoritesRepository = Get.find();

  final List<MovieDetails> _favoriteMovies = <MovieDetails>[];
  final List<SeriesDetails> _favoriteSeries = <SeriesDetails>[];
  final List<bool> _selectedMediaTypes =
      List.of([true, false], growable: false).obs;
  final _movieCount = 0.obs;
  final _seriesCount = 0.obs;

  get favoriteMovies => _favoriteMovies;

  get favoriteSeries => _favoriteSeries;

  get movieCount => _movieCount;

  get seriesCount => _seriesCount;

  get selectedMediaTypes => _selectedMediaTypes;

  void updateMediaType(final int index) {
    _selectedMediaTypes.fillRange(0, _selectedMediaTypes.length, false);
    _selectedMediaTypes[index] = true;
  }

  void getFavoriteMovies() {
    _favoriteMovies.clear();
    _favoriteMovies.addAll(_favoritesRepository.getAllFavoriteMovies());
    _movieCount.value = _favoriteMovies.length;
  }

  void getFavoriteSeries() {
    _favoriteSeries.clear();
    _favoriteSeries.addAll(_favoritesRepository.getAllFavoriteSeries());
    _seriesCount.value = _favoriteSeries.length;
  }
}
