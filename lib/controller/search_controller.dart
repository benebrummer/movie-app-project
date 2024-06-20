import 'package:get/get.dart';
import 'package:movie_app_project/entity/tv_series.dart';
import 'package:movie_app_project/repository/tmdb_repository.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../entity/movie.dart';

class MediaSearchController extends GetxController {
  final MediaRepository _mediaRepository = Get.find<MediaRepository>();

  static const List<(SearchCategory, String)> _searchCategories =
      <(SearchCategory, String)>[
    (SearchCategory.movies, 'Movies'),
    (SearchCategory.tvShows, 'TV Shows'),
  ];

  final List<bool> _selectedCategories = List.of({true, false});
  SearchCategory _selectedCategory = SearchCategory.movies;
  final _isSearching = false.obs;
  final _movieSearchResults = <Movie>[].obs;
  final _seriesSearchResults = <TvSeries>[].obs;

  List<bool> get selectedCategories => _selectedCategories;

  SearchCategory get selectedCategory => _selectedCategory;

  List<(SearchCategory, String)> get searchCategories => _searchCategories;

  String get currentlySelected {
    final int index = _selectedCategories.indexOf(true);
    return _searchCategories[index].$2;
  }

  List<Movie> get movieSearchResults => _movieSearchResults;

  List<TvSeries> get seriesSearchResults => _seriesSearchResults;

  bool get isSearching => _isSearching.value;

  set movieSearchResults(List<Movie> value) =>
      _movieSearchResults.value = value;

  set seriesSearchResults(List<TvSeries> value) =>
      _seriesSearchResults.value = value;

  set isSearching(bool value) => _isSearching.value = value;

  void updateSelectedCategory(final int index) {
    _selectedCategories.fillRange(0, _selectedCategories.length, false);
    _selectedCategories[index] = true;
    _selectedCategory = _searchCategories[index].$1;
    update();
  }

  void searchMedia(final String query) {
    final int index = _selectedCategories.indexOf(true);
    final SearchCategory current = _searchCategories[index].$1;
    current == SearchCategory.movies
        ? _searchMovies(query)
        : _searchSeries(query);
  }

  void _searchMovies(final String query) {
    isSearching = true;
    Future<List<Movie>> queriedMovies = _mediaRepository.searchMovie(query);
    queriedMovies.then((List<Movie> movies) {
      isSearching = false;
      movieSearchResults = movies;
    });
  }

  void _searchSeries(final String query) {
    isSearching = true;
    Future<List<TvSeries>> queriedSeries = _mediaRepository.searchSeries(query);
    queriedSeries.then((List<TvSeries> series) {
      isSearching = false;
      seriesSearchResults = series;
    });
  }
}

enum SearchCategory { movies, tvShows }
