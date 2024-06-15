import '../entity/movie.dart';

abstract class TmdbRepository {
  Future<List<Movie>> searchMovie(final String query);
  Future<List<Movie>> getPopularMovies(final MediaType mediaType);
  Future<List<Movie>> getTopRatedMovies(final MediaType mediaType);
  Future<List<Movie>> getUpcomingMovies();
  Future<List<Movie>> getNowPlayingMovies();
}

enum MediaType {
  movie,
  tv,
}

extension MediaTypeExtension on MediaType {
  String get name {
    switch (this) {
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
      default:
        return '';
    }
  }
}
