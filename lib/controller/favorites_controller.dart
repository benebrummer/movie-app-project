import 'package:get/get.dart';
import 'package:movie_app_project/api/repository/tmdb_repository.dart';

import '../entity/media/movie/movie_details.dart';
import '../entity/media/series/series_details.dart';
import '../persistence/favorites_repository.dart';

class FavoritesController extends GetxController {
  final FavoritesRepository _favoritesRepository = Get.find();
  final MediaRepository _mediaRepository = Get.find();

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

  void getFavorites() {
    getFavoriteMovies();
    getFavoriteSeries();
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

  bool isMovieFavorite(final int movieId) {
    return _favoritesRepository.getFavoriteMovie(movieId) != null;
  }

  bool isSeriesFavorite(final int seriesId) {
    return _favoritesRepository.getFavoriteSeries(seriesId) != null;
  }

  void addFavoriteMovie(final int id) async {
    final movie = await _mediaRepository.getMovieDetails(id);
    _favoritesRepository.addFavoriteMovie(movie);
    _favoriteMovies.add(movie);
    _movieCount.value++;
  }

  void removeFavoriteMovie(final int id) async {
    _favoritesRepository.removeFavoriteMovie(id);
    _favoriteMovies.removeWhere((element) => element.id == id);
    _movieCount.value--;
  }

  void addFavoriteSeries(final int id) async {
    final series = await _mediaRepository.getSeriesDetails(id);
    _favoritesRepository.addFavoriteSeries(series);
    _favoriteSeries.add(series);
    _seriesCount.value++;
  }

  void removeFavoriteSeries(final int id) async {
    _favoritesRepository.removeFavoriteSeries(id);
    _favoriteSeries.removeWhere((element) => element.id == id);
    _seriesCount.value--;
  }
}
