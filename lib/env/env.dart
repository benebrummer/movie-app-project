import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'TMDB_API_KEY')
  static const String tmdbApiKey = _Env.tmdbApiKey;

  @EnviedField(varName: 'TMDB_ACCESS_TOKEN')
  static const String tmdbAccessToken = _Env.tmdbAccessToken;
}
