import '../entity/movie.dart';
import '../entity/tv_series.dart';

abstract class TmdbRepository {
  // TODO: check discover endpoint
  Future<List<Movie>> searchMovie(final String query);
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getNowPlayingMovies();

  Future<List<TvSeries>> searchSeries(final String query);
  Future<List<TvSeries>> getPopularSeries();
  Future<List<TvSeries>> getTopRatedSeries();
  Future<List<TvSeries>> getAiringTodaySeries();
  Future<List<TvSeries>> getOnTheAirSeries();
}
