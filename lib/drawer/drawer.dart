import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/theme_controller.dart';
import 'package:movie_app_project/pages/browse/browse_page.dart';
import 'package:movie_app_project/pages/favorites/favorites_page.dart';

import '../controller/browse_controller.dart';
import '../controller/favorites_controller.dart';
import '../pages/search/search_page.dart';

class MovieAppDrawer extends StatelessWidget {
  MovieAppDrawer({super.key});

  final FavoritesController _favoritesController = Get.find();
  final BrowseController _browseController = Get.find<BrowseController>();
  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/tmdb_short.svg',
                        height: 60,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Search'),
              leading: const Icon(Icons.search),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }),
                );
              },
            ),
            ListTile(
              title: const Text('Browse'),
              leading: const Icon(Icons.movie),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BrowsePage();
                  }),
                );
                _browseController.browseMedia();
              },
            ),
            ListTile(
              title: const Text('Favorites'),
              leading: const Icon(Icons.favorite),
              onTap: () {
                _favoritesController.getFavorites();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FavoritesPage();
                    },
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: [
                  Text(_themeController.theme),
                  const Text(' Mode'),
                ],
              ),
              leading: const Icon(Icons.sunny),
              onTap: () {
                _themeController.updateTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
