import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/Selectors/category_selector.dart';
import 'package:movie_app_project/controller/browse_controller.dart';
import 'package:movie_app_project/drawer/drawer.dart';
import 'package:movie_app_project/pages/browse/widgets/now_playing_slider.dart';
import 'package:movie_app_project/pages/browse/widgets/top_rated_slider.dart';
import 'package:movie_app_project/pages/browse/widgets/trending_slider.dart';
import 'package:movie_app_project/pages/browse/widgets/upcoming_slider.dart';
import 'package:movie_app_project/pages/widgets/appbar/app_bar.dart';

class BrowsePage extends StatelessWidget {
  BrowsePage({super.key});

  final BrowseController controller = Get.find<BrowseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MovieAppDrawer(),
        appBar: const TmdbAppBar(title: 'Browse'),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategorySelector(),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Obx(() => controller.isLoading
                    ? const SizedBox(
                        height: 400,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : TrendingSlider()),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Top Rated',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Obx(
                  () => controller.isLoading
                      ? const SizedBox(
                          height: 250,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : TopRatedSlider(),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 30),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      controller.upcomingTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
                Obx(
                  () => controller.isLoading
                      ? const SizedBox(
                          height: 250,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : UpcomingSlider(),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 30),
                Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      controller.nowPlayingTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
                Obx(
                  () => controller.isLoading
                      ? const SizedBox(
                          height: 250,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : NowPlayingSlider(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}
