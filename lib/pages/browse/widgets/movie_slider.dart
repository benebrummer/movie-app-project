import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/browse_controller.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:movie_app_project/pages/browse/widgets/browse_details_movie.dart';
import 'package:movie_app_project/pages/browse/widgets/browse_details_series.dart';



class MovieSlider1 extends StatelessWidget {
  MovieSlider1({
    super.key,
    });

  final BrowseController controller = Get.find<BrowseController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Obx(() {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.resultCountTopRated,
          itemBuilder: (BuildContext context, int index) { 
            if (controller.selectedCategory == BrowseCategory.movies) {
              final Movie movie = controller.movieTopRatedResults[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsMovie(movie: movie)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200/(16/9),
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                      )
                    )
                  ),
                ),
              );
            } else{
              final TvSeries tvSeries = controller.seriesTopRatedResults[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsSeries(show: tvSeries)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200/(16/9),
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}'
                      )
                    )
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}

class MovieSlider2 extends StatelessWidget {
  MovieSlider2({
    super.key,
    });

  final BrowseController controller = Get.find<BrowseController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Obx(() {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.resultCountUpcoming,
          itemBuilder: (BuildContext context, int index) { 
            if (controller.selectedCategory == BrowseCategory.movies) {
              final Movie movie = controller.movieUpcomingResults[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsMovie(movie: movie)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200/(16/9),
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                      )
                    )
                  ),
                ),
              );
            } else{
              final TvSeries tvSeries = controller.seriesAiringTodayResults[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsSeries(show: tvSeries)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200/(16/9),
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}'
                      )
                    )
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}

class MovieSlider3 extends StatelessWidget {
  MovieSlider3({
    super.key,
    });

  final BrowseController controller = Get.find<BrowseController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Obx(() {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.resultCountNowPlaying,
          itemBuilder: (BuildContext context, int index) { 
            if (controller.selectedCategory == BrowseCategory.movies) {
              final Movie movie = controller.movieNowPlayingResults[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsMovie(movie: movie)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200/(16/9),
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                      )
                    )
                  ),
                ),
              );
            } else{
              final TvSeries tvSeries = controller.seriesOnTheAirResults[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsSeries(show: tvSeries)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 200,
                      width: 200/(16/9),
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}'
                      )
                    )
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}