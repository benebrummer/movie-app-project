import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/api/repository/tmdb_repository.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../entity/backdrop.dart';

class ImagesController extends GetxController {
  final MediaRepository _mediaRepository = Get.find();
  final Connectivity _connectivity = Connectivity();
  late List<Backdrop> _movieImages = [];
  late List<Backdrop> _seriesImages = [];
  final _isLoading = false.obs;
  final _offline = false.obs;

  get isLoading => _isLoading.value;
  get movieImages => _movieImages;
  get seriesImages => _seriesImages;
  get offline => _offline.value;

  void getMovieImages(final int movieId) async {
    _checkConnection();
    _isLoading.value = true;
    _movieImages = await _mediaRepository.getMovieImages(movieId);
    _isLoading.value = false;
  }

  void getSeriesImages(final int seriesId) async {
    _checkConnection();
    _isLoading.value = true;
    _seriesImages = await _mediaRepository.getSeriesImages(seriesId);
    _isLoading.value = false;
  }

  List<Backdrop> getImages(final MediaType mediaType) {
    return mediaType == MediaType.movie ? _movieImages : _seriesImages;
  }

  void _checkConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      _offline.value = true;
      _isLoading.value = false;
      return;
    }
    _offline.value = false;
  }
}
