import 'package:get/get.dart';
import 'package:movie_app_project/api/repository/tmdb_repository.dart';
import 'package:movie_app_project/entity/media/review/review.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ReviewController extends GetxController {
  final MediaRepository mediaRepository;
  ReviewController({required this.mediaRepository});

  final _isLoading = false.obs;
  List<Review> reviews = <Review>[].obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  void fetchReviews(final int mediaId, final MediaType mediaType) async {
    _isLoading.value = true;
    if (mediaType == MediaType.movie) {
      reviews = await mediaRepository.getMovieReviews(mediaId);
    } else {
      reviews = await mediaRepository.getSeriesReviews(mediaId);
    }
    _isLoading.value = false;
  }
}
