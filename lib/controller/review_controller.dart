import 'package:get/get.dart';
import 'package:movie_app_project/api/repository/tmdb_repository.dart';
import 'package:movie_app_project/entity/media/review/review.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ReviewController extends GetxController {
  final MediaRepository _mediaRepository = Get.find();

  final _isLoading = false.obs;
  List<Review> reviews = <Review>[].obs;

  bool get isLoading => _isLoading.value;

  void fetchReviews(final int mediaId, final MediaType mediaType) async {
    _isLoading.value = true;
    if (mediaType == MediaType.movie) {
      reviews = await _mediaRepository.getMovieReviews(mediaId);
    } else {
      reviews = await _mediaRepository.getSeriesReviews(mediaId);
    }
    _isLoading.value = false;
  }
}
