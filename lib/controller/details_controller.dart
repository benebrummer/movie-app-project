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

  void setCurrentMovieDetails(final MovieDetails movieDetails) {
    _currentMovieId = movieDetails.id;
    _currentMovieDetails = movieDetails;
    _isFavorite.value =
        _favoritesRepository.getFavoriteMovie(movieDetails.id) != null
            ? true
            : false;
  }

  void setCurrentSeriesDetails(final SeriesDetails seriesDetails) {
    _currentSeriesId = seriesDetails.id;
    _currentSeriesDetails = seriesDetails;
    _isFavorite.value =
        _favoritesRepository.getFavoriteSeries(seriesDetails.id) != null
            ? true
            : false;
  }

  void initMovieDetails(final int movieId) {
    _currentMovieId = movieId;
    if (_favoritesRepository.getFavoriteMovie(movieId) != null) {
      _isFavorite.value = true;
    } else {
      _isFavorite.value = false;
    }
    getMovieDetails();
  }

  void initSeriesDetails(final int seriesId) {
    _currentSeriesId = seriesId;
    if (_favoritesRepository.getFavoriteSeries(seriesId) != null) {
      _isFavorite.value = true;
    } else {
      _isFavorite.value = false;
    }
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

  void toggleFavorite() {
    _isFavorite.value = !_isFavorite.value;
  }
}
