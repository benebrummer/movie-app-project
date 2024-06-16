import '../entity/movie.dart';

abstract class TmdbRepository {
  Future<List<Movie>> searchMovie(final String query);
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getNowPlayingMovies();
}
