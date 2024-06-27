import 'package:hive/hive.dart';
import 'package:movie_app_project/entity/media/series/series_details.dart';
import 'package:movie_app_project/persistence/database_repository.dart';

import '../entity/media/movie/movie_details.dart';

class FavoritesRepository implements DatabaseRepository {
  final Box _favoriteMoviesBox;
  final Box _favoriteSeriesBox;

  FavoritesRepository(
      {required Box favoriteMoviesBox, required Box favoriteSeriesBox})
      : _favoriteMoviesBox = favoriteMoviesBox,
        _favoriteSeriesBox = favoriteSeriesBox;

  @override
  Future<void> addFavoriteMovie(final MovieDetails movie) {
    return _favoriteMoviesBox.put(movie.id, movie);
  }

  @override
  Future<void> addFavoriteSeries(final SeriesDetails series) {
    return _favoriteSeriesBox.put(series.id, series);
  }

  @override
  MovieDetails? getFavoriteMovie(final int movieId) {
    return _favoriteMoviesBox.get(movieId);
  }

  @override
  SeriesDetails? getFavoriteSeries(int seriesId) {
    return _favoriteSeriesBox.get(seriesId);
  }

  @override
  void removeFavoriteMovie(final int movieId) async {
    _favoriteMoviesBox.delete(movieId);
  }

  @override
  void removeFavoriteSeries(final int seriesId) async {
    _favoriteSeriesBox.delete(seriesId);
  }

  @override
  List<MovieDetails> getAllFavoriteMovies() {
    List<MovieDetails> movies =
        _favoriteMoviesBox.values.toList().cast<MovieDetails>();
    return movies;
  }

  @override
  List<SeriesDetails> getAllFavoriteSeries() {
    List<SeriesDetails> series =
        _favoriteSeriesBox.values.toList().cast<SeriesDetails>();
    return series;
  }
}
