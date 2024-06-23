import 'package:get/get.dart';
import 'package:movie_app_project/entity/media/movie/movie_details.dart';
import 'package:movie_app_project/repository/tmdb_repository.dart';

import '../entity/media/series/series_details.dart';

class DetailsController extends GetxController {
  final MediaRepository _mediaRepository = Get.find();
  final _isLoading = false.obs;

  late MovieDetails _currentMovieDetails;
  late SeriesDetails _currentSeriesDetails;
  int _currentMovieId = 0;
  int _currentSeriesId = 0;

  get isLoading => _isLoading.value;
  MovieDetails get currentMovieDetails => _currentMovieDetails;
  SeriesDetails get currentSeriesDetails => _currentSeriesDetails;

  void initMovieDetails(final int movieId) {
    _currentMovieId = movieId;
    getMovieDetails();
  }

  void initSeriesDetails(final int seriesId) {
    _currentSeriesId = seriesId;
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
}
