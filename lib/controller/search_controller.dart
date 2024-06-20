import 'package:get/get.dart';
import 'package:movie_app_project/repository/tmdb_repository.dart';

import '../entity/movie.dart';

class MediaSearchController extends GetxController {
  final MediaRepository _mediaRepository = Get.put(MediaRepository());
  static const List<(SearchCategory, String)> _searchCategories =
      <(SearchCategory, String)>[
    (SearchCategory.movies, 'Movies'),
    (SearchCategory.tvShows, 'TV Shows'),
  ];

  final List<bool> _selectedCategories = List.of({true, false});
  final _isSearching = false.obs;
  final _searchResults = <Movie>[].obs;

  List<bool> get selectedCategory => _selectedCategories;
  List<(SearchCategory, String)> get searchCategories => _searchCategories;
  String get currentlySelected {
    final int index = _selectedCategories.indexOf(true);
    return _searchCategories[index].$2;
  }

  List<Movie> get searchResults => _searchResults;
  bool get isSearching => _isSearching.value;

  set searchResults(List<Movie> value) => _searchResults.value = value;
  set isSearching(bool value) => _isSearching.value = value;

  void updateSelectedCategory(final int index) {
    _selectedCategories.fillRange(0, _selectedCategories.length, false);
    _selectedCategories[index] = true;
    update();
  }

  void searchMovies(final String query) {
    isSearching = true;
    Future<List<Movie>> queriedMovies = _mediaRepository.searchMovie(query);
    queriedMovies.then((List<Movie> movies) {
      isSearching = false;
      searchResults = movies;
    });
  }
}

enum SearchCategory { movies, tvShows }
