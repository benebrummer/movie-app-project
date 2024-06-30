import 'package:movie_app_project/api/repository/repository.dart';
import 'package:movie_app_project/entity/backdrop.dart';
import 'package:movie_app_project/entity/media/series/series_details.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../entity/media/movie/movie.dart';
import '../../entity/media/movie/movie_details.dart';
import '../../entity/media/review/review.dart';
import '../../env/env.dart';

class MediaRepository extends TmdbRepository {
  final tmdbClient = TMDB(
    ApiKeys(Env.tmdbApiKey, Env.tmdbAccessToken),
  );

  @override
  Future<Map<dynamic, dynamic>> searchMovie(
      final String query, final int page) async {
    final Map response =
        await tmdbClient.v3.search.queryMovies(query, page: page);
    return response;
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
    final Map response = await tmdbClient.v3.movies.getUpcoming();
    return _mapResultsToMovieList(response);
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final Map response = await tmdbClient.v3.movies.getNowPlaying();
    return _mapResultsToMovieList(response);
  }

  @override
  Future<List<Review>> getMovieReviews(final int movieId) async {
    final Map response = await tmdbClient.v3.movies.getReviews(movieId);
    return _mapResultsToReviewList(response);
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    final Map<dynamic, dynamic> response =
        await tmdbClient.v3.movies.getDetails(movieId);
    return MovieDetails.fromJson(response);
  }

  @override
  Future<Map<dynamic, dynamic>> searchSeries(
      final String query, final int page) async {
    final Map response =
        await tmdbClient.v3.search.queryTvShows(query, page: page);
    return response;
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
  Future<SeriesDetails> getSeriesDetails(int seriesId) async {
    final Map<dynamic, dynamic> response =
        await tmdbClient.v3.tv.getDetails(seriesId);
    return SeriesDetails.fromJson(response);
  }

  @override
  Future<List<Review>> getSeriesReviews(final int seriesId) async {
    final Map response = await tmdbClient.v3.tv.getReviews(seriesId);
    return _mapResultsToReviewList(response);
  }

  @override
  Future<List<Backdrop>> getMovieImages(int movieId) async {
    final Map response = await tmdbClient.v3.movies
        .getImages(movieId, includeImageLanguage: 'en,null');
    return response['backdrops']
        .map<Backdrop>((json) => Backdrop.fromJson(json))
        .toList();
  }

  @override
  Future<List<Backdrop>> getSeriesImages(int seriesId) async {
    final Map response = await tmdbClient.v3.tv
        .getImages(seriesId, includeImageLanguage: 'en,null');
    return response['backdrops']
        .map<Backdrop>((json) => Backdrop.fromJson(json))
        .toList();
  }

  Future<List<Movie>> _mapResultsToMovieList(final Map response) async {
    final List<dynamic> results = response['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<TvSeries>> _mapResultsToSeriesList(final Map response) async {
    final List<dynamic> results = response['results'];
    return results.map((json) => TvSeries.fromJson(json)).toList();
  }

  Future<List<Review>> _mapResultsToReviewList(final Map response) async {
    final List<dynamic> results = response['results'];
    return results.map((json) => Review.fromJson(json)).toList();
  }
}
