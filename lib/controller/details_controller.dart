import 'package:get/get.dart';
import 'package:movie_app_project/entity/media/movie/movie_details.dart';

import '../api/repository/tmdb_repository.dart';
import '../entity/media/series/series_details.dart';
import '../persistence/favorites_repository.dart';

class DetailsController extends GetxController {
  final MediaRepository _mediaRepository = Get.find();
  final FavoritesRepository _favoritesRepository = Get.find();

  final _isLoading = false.obs;
  final _isFavorite = false.obs;

  late MovieDetails _currentMovieDetails;
  late SeriesDetails _currentSeriesDetails;
  int _currentMovieId = 0;
  int _currentSeriesId = 0;

  get isLoading => _isLoading.value;

  get isFavorite => _isFavorite.value;

  MovieDetails get currentMovieDetails => _currentMovieDetails;

  SeriesDetails get currentSeriesDetails => _currentSeriesDetails;

  void initMovieDetails(final int movieId) {
    _currentMovieId = movieId;
    movieInFavorites();
    getMovieDetails();
  }

  void initSeriesDetails(final int seriesId) {
    _currentSeriesId = seriesId;
    seriesInFavorites();
    getSeriesDetails();
  }

  void getMovieDetails() async {
    _isLoading.value = true;
    final response = _mediaRepository.getMovieDetails(_currentMovieId);
    response.then(
      (value) => {
        _currentMovieDetails = value,
        _isLoading.value = false,
      },
    );
  }

  void getSeriesDetails() async {
    _isLoading.value = true;
    final response = _mediaRepository.getSeriesDetails(_currentSeriesId);
    response.then(
      (value) => {
        _currentSeriesDetails = value,
        _isLoading.value = false,
      },
    );
  }

  List<String> getProductionCompanyNames() {
    return _currentMovieDetails.productionCompanies.map((e) => e.name).toList();
  }

  void addFavoriteMovie() async {
    _favoritesRepository.addFavoriteMovie(_currentMovieDetails);
    _isFavorite.value = true;
  }

  void removeFavoriteMovie() async {
    _favoritesRepository.removeFavoriteMovie(_currentMovieId);
    _isFavorite.value = false;
  }

  void movieInFavorites() {
    final movie = _favoritesRepository.getFavoriteMovie(_currentMovieId);
    _isFavorite.value = movie != null;
  }

  void addFavoriteSeries() async {
    _favoritesRepository.addFavoriteSeries(_currentSeriesDetails);
    _isFavorite.value = true;
  }

  void removeFavoriteSeries() async {
    _favoritesRepository.removeFavoriteSeries(_currentSeriesId);
    _isFavorite.value = false;
  }

  void seriesInFavorites() {
    final series = _favoritesRepository.getFavoriteSeries(_currentSeriesId);
    _isFavorite.value = series != null;
  }
}
