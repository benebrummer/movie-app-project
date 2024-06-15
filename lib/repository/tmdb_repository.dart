import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_project/repository/repository.dart';

import '../entity/movie.dart';
import '../env/env.dart';

class MediaRepository extends TmdbRepository {
  final String apiKey = Env.tmdbApiKey;
  final String baseUrl = 'https://api.themoviedb.org/3/';

  @override
  Future<List<Movie>> searchMovie(final String query) async {
    // TODO: add paging
    final response = await http
        .get(Uri.parse('${baseUrl}search/movie?api_key=$apiKey&query=$query'));

    if (response.statusCode != 200) {
      throw Exception('Failed to search movie');
    }

    // paging?
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    final List<dynamic> results = decodedJson['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  @override
  Future<List<Movie>> getPopularMovies(final MediaType mediaType) async {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRatedMovies(final MediaType mediaType) async {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    // TODO: implement getUpcomingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }
}
