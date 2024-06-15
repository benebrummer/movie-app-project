import '../entity/media_type.dart';
import '../entity/movie.dart';

abstract class TmdbRepository {
  Future<List<Movie>> searchMovie(final String query);
  Future<List<Movie>> getPopularMovies(final MediaType mediaType);
  Future<List<Movie>> getTopRatedMovies(final MediaType mediaType);
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getNowPlayingMovies();
}
