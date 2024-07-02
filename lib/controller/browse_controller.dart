import 'package:get/get.dart';
import 'package:movie_app_project/api/repository/tmdb_repository.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';

class BrowseController extends GetxController {
  final MediaRepository _mediaRepository = Get.find<MediaRepository>();

  static const List<(BrowseCategory, String)> _browseCategories =
      <(BrowseCategory, String)>[
    (BrowseCategory.movies, 'Movies'),
    (BrowseCategory.tvShows, 'TV Shows'),
  ];

  final List<bool> _selectedCategories = List.of({true, false});
  BrowseCategory _selectedCategory = BrowseCategory.movies;
  final _isLoading = false.obs;
  final _resultCountPopular = 0.obs;
  final _resultCountTopRated = 0.obs;
  final _resultCountUpcoming = 0.obs;
  final _resultCountNowPlaying = 0.obs;
  final _nowPlayingTitle = ''.obs;
  final _upcomingTitle = ''.obs;
  final _moviePopularResults = <Movie>[].obs;
  final _movieTopRatedResults = <Movie>[].obs;
  final _movieUpcomingResults = <Movie>[].obs;
  final _movieNowPlayingResults = <Movie>[].obs;
  final _seriesPopularResults = <TvSeries>[].obs;
  final _seriesTopRatedResults = <TvSeries>[].obs;
  final _seriesAiringTodayResults = <TvSeries>[].obs;
  final _seriesOnTheAirResults = <TvSeries>[].obs;

  List<bool> get selectedCategories => _selectedCategories;
  BrowseCategory get selectedCategory => _selectedCategory;
  List<(BrowseCategory, String)> get browseCategories => _browseCategories;
  List<Movie> get moviePopularResults => _moviePopularResults;
  List<Movie> get movieTopRatedResults => _movieTopRatedResults;
  List<Movie> get movieUpcomingResults => _movieUpcomingResults;
  List<Movie> get movieNowPlayingResults => _movieNowPlayingResults;
  List<TvSeries> get seriesPopularResults => _seriesPopularResults;
  List<TvSeries> get seriesTopRatedResults => _seriesTopRatedResults;
  List<TvSeries> get seriesAiringTodayResults => _seriesAiringTodayResults;
  List<TvSeries> get seriesOnTheAirResults => _seriesOnTheAirResults;
  bool get isLoading => _isLoading.value;
  int get resultCountPopular => _resultCountPopular.value;
  int get resultCountTopRated => _resultCountTopRated.value;
  int get resultCountUpcoming => _resultCountUpcoming.value;
  int get resultCountNowPlaying => _resultCountNowPlaying.value;
  String get upcomingTitle => _upcomingTitle.value;
  String get nowPlayingTitle => _nowPlayingTitle.value;

  String get currentlySelected {
    final int index = _selectedCategories.indexOf(true);
    return _browseCategories[index].$2;
  }

  set moviePopularResults(List<Movie> value) =>
      _moviePopularResults.value = value;
  set movieTopRatedResults(List<Movie> value) =>
      _movieTopRatedResults.value = value;
  set movieUpcomingResults(List<Movie> value) =>
      _movieUpcomingResults.value = value;
  set movieNowPlayingResults(List<Movie> value) =>
      _movieNowPlayingResults.value = value;
  set seriesPopularResults(List<TvSeries> value) =>
      _seriesPopularResults.value = value;
  set seriesTopRatedResults(List<TvSeries> value) =>
      _seriesTopRatedResults.value = value;
  set seriesAiringTodayResults(List<TvSeries> value) =>
      _seriesAiringTodayResults.value = value;
  set seriesOnTheAirResults(List<TvSeries> value) =>
      _seriesOnTheAirResults.value = value;
  set upcomingTitle(String value) => _upcomingTitle.value = value;
  set nowPlayingTitle(String value) => _nowPlayingTitle.value = value;
  set isLoading(bool value) => _isLoading.value = value;
  set resultCountPopular(int value) => _resultCountPopular.value = value;
  set resultCountTopRated(int value) => _resultCountTopRated.value = value;
  set resultCountUpcoming(int value) => _resultCountUpcoming.value = value;
  set resultCountNowPlaying(int value) => _resultCountNowPlaying.value = value;

  void browseMedia() async {
    resultCountPopular = 0;
    resultCountTopRated = 0;
    resultCountUpcoming = 0;
    resultCountNowPlaying = 0;
    final BrowseCategory current = _selectedCategory;
    isLoading = true;
    checkTitle();
    if (current == BrowseCategory.movies) {
      _getAllMovies();
    } else {
      _getAllSeries();
    }
  }

  void checkTitle() {
    final BrowseCategory current = _selectedCategory;
    if (current == BrowseCategory.movies) {
      upcomingTitle = 'Upcoming';
      nowPlayingTitle = 'Now Playing';
    } else {
      upcomingTitle = 'Airing Soon';
      nowPlayingTitle = 'Now on Air';
    }
  }

  void updateSelectedCategory(final int index) {
    _selectedCategories.fillRange(0, _selectedCategories.length, false);
    _selectedCategories[index] = true;
    _selectedCategory = _browseCategories[index].$1;
    browseMedia();
    checkTitle();
    update();
  }

  Future<void> _getPopularMovies() async {
    final movies = await _mediaRepository.getPopularMovies();
    if (movies.isEmpty) {
      return;
    }
    resultCountPopular = movies.length;
    moviePopularResults = movies;
  }

  Future<void> _getTopRatedMovies() async {
    final movies = await _mediaRepository.getTopRatedMovies();
    if (movies.isEmpty) {
      return;
    }
    resultCountTopRated = movies.length;
    movieTopRatedResults = movies;
  }

  Future<void> _getUpcomingMovies() async {
    final movies = await _mediaRepository.getUpcomingMovies();
    if (movies.isEmpty) {
      return;
    }
    resultCountUpcoming = movies.length;
    movieUpcomingResults = movies;
  }

  Future<void> _getNowPlayingMovies() async {
    final movies = await _mediaRepository.getNowPlayingMovies();
    if (movies.isEmpty) {
      return;
    }
    resultCountNowPlaying = movies.length;
    movieNowPlayingResults = movies;
  }

  Future<void> _getPopularSeries() async {
    final series = await _mediaRepository.getPopularSeries();
    if (series.isEmpty) {
      return;
    }
    resultCountPopular = series.length;
    seriesPopularResults = series;
  }

  Future<void> _getTopRatedSeries() async {
    final series = await _mediaRepository.getTopRatedSeries();
    if (series.isEmpty) {
      return;
    }
    resultCountTopRated = series.length;
    seriesTopRatedResults = series;
  }

  Future<void> _getAiringTodaySeries() async {
    final series = await _mediaRepository.getAiringTodaySeries();
    if (series.isEmpty) {
      return;
    }
    resultCountUpcoming = series.length;
    seriesAiringTodayResults = series;
  }

  Future<void> _getOnTheAirSeries() async {
    final series = await _mediaRepository.getOnTheAirSeries();
    if (series.isEmpty) {
      return;
    }
    resultCountNowPlaying = series.length;
    seriesOnTheAirResults = series;
  }

  void _getAllMovies() async {
    await Future.wait([
      _getPopularMovies(),
      _getTopRatedMovies(),
      _getUpcomingMovies(),
      _getNowPlayingMovies(),
    ]);
    isLoading = false;
  }

  void _getAllSeries() async {
    await Future.wait([
      _getPopularSeries(),
      _getTopRatedSeries(),
      _getAiringTodaySeries(),
      _getOnTheAirSeries(),
    ]);
    isLoading = false;
  }
}

enum BrowseCategory {
  movies,
  tvShows,
}
