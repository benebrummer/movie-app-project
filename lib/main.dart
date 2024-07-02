import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_project/controller/browse_controller.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/controller/favorites_controller.dart';
import 'package:movie_app_project/controller/images_controller.dart';
import 'package:movie_app_project/controller/review_controller.dart';
import 'package:movie_app_project/controller/search_controller.dart';
import 'package:movie_app_project/controller/theme_controller.dart';
import 'package:movie_app_project/entity/media/collection.dart';
import 'package:movie_app_project/entity/media/genre.dart';
import 'package:movie_app_project/entity/media/language.dart';
import 'package:movie_app_project/entity/media/production_company.dart';
import 'package:movie_app_project/entity/media/series/creator.dart';
import 'package:movie_app_project/entity/media/series/episode.dart';
import 'package:movie_app_project/entity/media/series/network.dart';
import 'package:movie_app_project/entity/media/series/season.dart';
import 'package:movie_app_project/entity/media/series/series_details.dart';
import 'package:movie_app_project/pages/search/search_page.dart';
import 'package:movie_app_project/persistence/favorites_repository.dart';
import 'package:movie_app_project/theme.dart';
import 'package:path_provider/path_provider.dart';

import 'api/repository/tmdb_repository.dart';
import 'entity/media/movie/movie_details.dart';
import 'entity/media/production_country.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeHive();
  await _initializeDependencies();
  runApp(MovieApp());
}

Future<void> _initializeHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(MovieDetailsAdapter())
    ..registerAdapter(CollectionAdapter())
    ..registerAdapter(GenreAdapter())
    ..registerAdapter(LanguageAdapter())
    ..registerAdapter(ProductionCompanyAdapter())
    ..registerAdapter(ProductionCountryAdapter())
    ..registerAdapter(SeriesDetailsAdapter())
    ..registerAdapter(CreatorAdapter())
    ..registerAdapter(EpisodeAdapter())
    ..registerAdapter(NetworkAdapter())
    ..registerAdapter(SeasonAdapter());
}

Future<void> _initializeDependencies() async {
  final Box<MovieDetails> movieBox =
      await Hive.openBox<MovieDetails>('favoriteMovies');
  final Box<SeriesDetails> seriesBox = await Hive.openBox('favoriteSeries');
  // Hive.deleteFromDisk();
  Get.put(FavoritesRepository(
    favoriteMoviesBox: movieBox,
    favoriteSeriesBox: seriesBox,
  ));
  Get.put(MediaRepository());
  Get.put(ReviewController());
  Get.put(FavoritesController());
  Get.put(MediaSearchController());
  Get.put(DetailsController());
  Get.put(BrowseController());
  Get.put(ImagesController());
  Get.put(ThemeController());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: SearchPage(),
    );
  }
}
