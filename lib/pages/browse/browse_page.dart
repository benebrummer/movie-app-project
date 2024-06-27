import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/browse_controller.dart';
import 'package:movie_app_project/drawer/drawer.dart';
import 'package:movie_app_project/pages/browse/widgets/category_selector.dart';
import 'package:movie_app_project/pages/browse/widgets/movie_slider.dart';
import 'package:movie_app_project/pages/browse/widgets/trending_slider.dart';

class BrowsePage extends StatelessWidget {
   BrowsePage({super.key});

  final BrowseController controller = Get.find<BrowseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MovieAppDrawer(),
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Browse',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategorySelector(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Popular',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TrendingSlider(),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('Top Rated',
                style: TextStyle(fontSize: 20),
              ),
            ),
            MovieSlider1(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Obx(() {
                return Text(controller.upcomingTitle, style: const TextStyle(fontSize: 20),);
              }),
            ),
            MovieSlider2(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Obx(() {
                return Text(controller.nowPlayingTitle, style: const TextStyle(fontSize: 20),);
              }),
            ),
            MovieSlider3(),
          ],
        ),
      )
    );
  }
}