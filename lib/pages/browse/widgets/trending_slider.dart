import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/browse_controller.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:movie_app_project/pages/browse/widgets/browse_details_movie.dart';
import 'package:movie_app_project/pages/browse/widgets/browse_details_series.dart';


class TrendingSlider extends StatelessWidget {
  TrendingSlider({super.key});
  
  final BrowseController controller = Get.find<BrowseController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Obx( () {
        //debugPrint(controller.resultCountPopular.toString());
        if (controller.resultCountPopular == 0) {
          return const SizedBox();
        }
        return CarouselSlider.builder(
          itemCount: controller.resultCountPopular,
          options: CarouselOptions(
            height: 300, autoPlay: true,
            viewportFraction:  0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1)
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            if (controller.selectedCategory == BrowseCategory.movies) {
              final Movie movie = controller.moviePopularResults[itemIndex];
              return GestureDetector(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsMovie(movie: movie)));
                  },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                    ),
                  ),
                ),
              );
            } else {
              final TvSeries tvSeries = controller.seriesPopularResults[itemIndex];
              return GestureDetector(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseDetailsSeries(show: tvSeries)));
                  },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}'
                    ),
                  ),
                ),
              );
            }
          },
        );
      })
    );
  }
}