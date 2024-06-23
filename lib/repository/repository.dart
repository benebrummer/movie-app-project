import 'package:movie_app_project/entity/media/movie/movie_details.dart';
import 'package:movie_app_project/entity/media/series/series_details.dart';

import '../entity/media/movie/movie.dart';
import '../entity/media/review/review.dart';
import '../entity/media/series/tv_series.dart';

abstract class TmdbRepository {
  // TODO: check discover endpoint
  Future<Map<dynamic, dynamic>> searchMovie(final String query, final int page);
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Review>> getMovieReviews(final int movieId);
  Future<MovieDetails> getMovieDetails(final int movieId);

  Future<Map<dynamic, dynamic>> searchSeries(
      final String query, final int page);
  Future<List<TvSeries>> getPopularSeries();
  Future<List<TvSeries>> getTopRatedSeries();
  Future<List<TvSeries>> getAiringTodaySeries();
  Future<List<TvSeries>> getOnTheAirSeries();
  Future<List<Review>> getSeriesReviews(final int seriesId);
  Future<SeriesDetails> getSeriesDetails(final int seriesId);
}
