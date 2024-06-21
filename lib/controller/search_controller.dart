import 'package:get/get.dart';
import 'package:movie_app_project/entity/tv_series.dart';
import 'package:movie_app_project/repository/tmdb_repository.dart';

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
  String searchQuery = '';
  final _isSearching = false.obs;
  final _resultCount = 0.obs; // TODO: observable really needed here?
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
  int get resultCount => _resultCount.value;

  set movieSearchResults(List<Movie> value) =>
      _movieSearchResults.value = value;
  set seriesSearchResults(List<TvSeries> value) =>
      _seriesSearchResults.value = value;
  set isSearching(bool value) => _isSearching.value = value;
  set resultCount(int value) => _resultCount.value = value;

  void updateSelectedCategory(final int index) {
    _selectedCategories.fillRange(0, _selectedCategories.length, false);
    _selectedCategories[index] = true;
    _selectedCategory = _searchCategories[index].$1;

    if (searchQuery.isNotEmpty) {
      searchMedia(searchQuery);
    }
    update();
  }

  void searchMedia(final String query) {
    searchQuery = query;
    resultCount = 0;
    final SearchCategory current = _selectedCategory;
    current == SearchCategory.movies
        ? _searchMovies(query)
        : _searchSeries(query);
  }

  Future<void> _searchMovies(final String query) async {
    isSearching = true;
    final queriedMovies = await _mediaRepository.searchMovie(query);
    if (queriedMovies.isNotEmpty) {
      resultCount = queriedMovies.length;
      movieSearchResults = queriedMovies;
    }
    isSearching = false;
  }

  void _searchSeries(final String query) async {
    isSearching = true;
    final queriedSeries = await _mediaRepository.searchSeries(query);
    if (queriedSeries.isNotEmpty) {
      resultCount = queriedSeries.length;
      seriesSearchResults = queriedSeries;
    }
    isSearching = false;
  }
}

enum SearchCategory {
  movies,
  tvShows,
}
