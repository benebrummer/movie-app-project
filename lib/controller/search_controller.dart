import 'package:get/get.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:movie_app_project/repository/tmdb_repository.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../entity/media/movie/movie.dart';

class MediaSearchController extends GetxController {
  final MediaRepository _mediaRepository = Get.find<MediaRepository>();

  static const List<(MediaType, String)> _searchMediaTypes =
      <(MediaType, String)>[
    (MediaType.movie, 'Movies'),
    (MediaType.tv, 'TV Shows'),
  ];

  final List<bool> _selectedMediaTypes = List.of({true, false});
  MediaType _selectedMediaType = MediaType.movie;
  String searchQuery = '';
  int _currentPage = 1;
  int _totalPages = 1;
  final _isSearching = false.obs;
  final _resultCount = 0.obs;
  final _movieSearchResults = <Movie>[].obs;
  final _seriesSearchResults = <TvSeries>[].obs;

  List<bool> get selectedMediaTypes => _selectedMediaTypes;
  MediaType get selectedMediaType => _selectedMediaType;
  List<(MediaType, String)> get searchMediaTypes => _searchMediaTypes;
  List<Movie> get movieSearchResults => _movieSearchResults;
  List<TvSeries> get seriesSearchResults => _seriesSearchResults;
  bool get isSearching => _isSearching.value;
  int get resultCount => _resultCount.value;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;

  set movieSearchResults(List<Movie> value) =>
      _movieSearchResults.value = value;
  set seriesSearchResults(List<TvSeries> value) =>
      _seriesSearchResults.value = value;
  set isSearching(bool value) => _isSearching.value = value;
  set resultCount(int value) => _resultCount.value = value;

  void updateSelectedCategory(final int index) {
    _resetPaging();
    _selectedMediaTypes.fillRange(0, _selectedMediaTypes.length, false);
    _selectedMediaTypes[index] = true;
    _selectedMediaType = _searchMediaTypes[index].$1;

    if (searchQuery.isNotEmpty) {
      searchMedia(searchQuery);
    }
    update();
  }

  String getSelectedMediaTypeString() {
    return _searchMediaTypes[_selectedMediaTypes.indexOf(true)].$2;
  }

  void searchMedia(final String query) {
    _resetPaging();
    searchQuery = query;
    resultCount = 0;
    isSearching = true;
    _selectedMediaType == MediaType.movie
        ? _searchMovies(query)
        : _searchSeries(query);
  }

  Future<void> _searchMovies(final String query) async {
    final response = await _mediaRepository.searchMovie(query, 1);
    if (response.isEmpty) {
      return;
    }
    _totalPages = response['total_pages'];
    final List<Movie> movies = _mapResultsToMovieList(response);
    resultCount = movies.length;
    movieSearchResults = movies;
    isSearching = false;
  }

  void _searchSeries(final String query) async {
    final response = await _mediaRepository.searchSeries(query, _currentPage);
    if (response.isEmpty) {
      return;
    }
    _totalPages = response['total_pages'];
    final List<TvSeries> series = _mapResultsToSeriesList(response);
    resultCount = series.length;
    seriesSearchResults = series;
    isSearching = false;
  }

  void loadMoreResults() async {
    if (_currentPage >= _totalPages) {
      return;
    }
    if (_selectedMediaType == MediaType.movie) {
      final response =
          await _mediaRepository.searchMovie(searchQuery, ++_currentPage);
      final List<Movie> movies = _mapResultsToMovieList(response);
      resultCount += movies.length;
      movieSearchResults.addAll(movies);
    } else {
      final response =
          await _mediaRepository.searchSeries(searchQuery, ++_currentPage);
      final List<TvSeries> series = _mapResultsToSeriesList(response);
      resultCount += series.length;
      seriesSearchResults.addAll(series);
    }
  }

  void resetSearchQuery() {
    searchQuery = '';
  }

  void _resetPaging() {
    _currentPage = 1;
    _totalPages = 1;
  }

  List<Movie> _mapResultsToMovieList(final Map response) {
    final List<dynamic> results = response['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  List<TvSeries> _mapResultsToSeriesList(final Map response) {
    final List<dynamic> results = response['results'];
    return results.map((json) => TvSeries.fromJson(json)).toList();
  }
}
