import 'package:movie_app_project/entity/tv_series.dart';
import 'package:movie_app_project/repository/repository.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../entity/movie.dart';
import '../entity/review.dart';
import '../env/env.dart';

class MediaRepository extends TmdbRepository {
  final tmdbClient = TMDB(
    ApiKeys(Env.tmdbApiKey, Env.tmdbAccessToken),
  );

  @override
  Future<List<Movie>> searchMovie(final String query) async {
    // TODO: add paging
    final Map response = await tmdbClient.v3.search.queryMovies(query);
    return _mapResultsToMovieList(response);
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final Map response = await tmdbClient.v3.movies.getPopular();
    return _mapResultsToMovieList(response);
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final Map response = await tmdbClient.v3.movies.getTopRated();
    return _mapResultsToMovieList(response);
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    // TODO: dates in response?
    final Map response = await tmdbClient.v3.movies.getUpcoming();
    return _mapResultsToMovieList(response);
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    // TODO: dates in response?
    final Map response = await tmdbClient.v3.movies.getNowPlaying();
    return _mapResultsToMovieList(response);
  }

  @override
  Future<List<Review>> getMovieReviews(final int movieId) async {
    final Map response = await tmdbClient.v3.movies.getReviews(movieId);
    final List<dynamic> results = response['results'];
    return results.map((json) => Review.fromJson(json)).toList();
  }

  @override
  Future<List<TvSeries>> searchSeries(final String query) async {
    final Map response = await tmdbClient.v3.search.queryTvShows(query);
    return _mapResultsToSeriesList(response);
  }

  @override
  Future<List<TvSeries>> getPopularSeries() async {
    final Map response = await tmdbClient.v3.tv.getPopular();
    return _mapResultsToSeriesList(response);
  }

  @override
  Future<List<TvSeries>> getTopRatedSeries() async {
    final Map response = await tmdbClient.v3.tv.getTopRated();
    return _mapResultsToSeriesList(response);
  }

  @override
  Future<List<TvSeries>> getOnTheAirSeries() async {
    final Map response = await tmdbClient.v3.tv.getOnTheAir();
    return _mapResultsToSeriesList(response);
  }

  @override
  Future<List<TvSeries>> getAiringTodaySeries() async {
    final Map response = await tmdbClient.v3.tv.getAiringToday();
    return _mapResultsToSeriesList(response);
  }

  @override
  Future<List<Review>> getSeriesReviews(final int seriesId) async {
    final Map response = await tmdbClient.v3.tv.getReviews(seriesId);
    final List<dynamic> results = response['results'];
    return results.map((json) => Review.fromJson(json)).toList();
  }

  Future<List<Movie>> _mapResultsToMovieList(final Map response) async {
    final List<dynamic> results = response['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<TvSeries>> _mapResultsToSeriesList(final Map response) async {
    final List<dynamic> results = response['results'];
    return results.map((json) => TvSeries.fromJson(json)).toList();
  }
}
