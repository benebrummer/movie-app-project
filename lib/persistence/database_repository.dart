import 'package:movie_app_project/entity/media/movie/movie_details.dart';
import 'package:movie_app_project/entity/media/series/series_details.dart';

abstract class DatabaseRepository {
  Future<void> addFavoriteMovie(final MovieDetails movie);

  MovieDetails? getFavoriteMovie(final int movieId);

  void removeFavoriteMovie(final int movieId);

  Future<void> addFavoriteSeries(final SeriesDetails series);

  SeriesDetails? getFavoriteSeries(final int seriesId);

  void removeFavoriteSeries(final int seriesId);

  List<MovieDetails> getAllFavoriteMovies();

  List<SeriesDetails> getAllFavoriteSeries();
}
