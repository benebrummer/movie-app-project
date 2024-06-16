import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_project/repository/repository.dart';

import '../entity/movie.dart';
import '../env/env.dart';

class MediaRepository extends TmdbRepository {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = Env.tmdbApiKey;

  @override
  Future<List<Movie>> searchMovie(final String query) async {
    // TODO: add paging
    final response = await http
        .get(Uri.parse('$baseUrl/search/movie?api_key=$apiKey&query=$query'));
    if (response.statusCode != 200) {
      throw Exception('Failed to search movie');
    }
    // paging?
    return _mapResponseToMovieList(response.body);
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode != 200) {
      throw Exception('Failed to get popular movies');
    }
    return _mapResponseToMovieList(response.body);
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey'));
    if (response.statusCode != 200) {
      throw Exception('Failed to get top rated movies');
    }
    return _mapResponseToMovieList(response.body);
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    // TODO: dates in response?
    final response =
        await http.get(Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey'));
    if (response.statusCode != 200) {
      throw Exception('Failed to get upcoming movies');
    }
    return _mapResponseToMovieList(response.body);
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    // TODO: dates in response?
    final response =
        await http.get(Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'));
    if (response.statusCode != 200) {
      throw Exception('Failed to get now playing movies');
    }
    return _mapResponseToMovieList(response.body);
  }

  List<Movie> _mapResponseToMovieList(final String response) {
    final Map<String, dynamic> decodedJson = jsonDecode(response);
    final List<dynamic> results = decodedJson['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  }
}
