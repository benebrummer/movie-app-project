import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/pages/browse/browse_page.dart';
import 'package:movie_app_project/pages/favorites/favorites_page.dart';

import '../controller/browse_controller.dart';
import '../controller/favorites_controller.dart';
import '../pages/search/search_page.dart';

class MovieAppDrawer extends StatelessWidget {
  MovieAppDrawer({super.key});

  final FavoritesController _favoritesController = Get.find();
  final BrowseController _browseController = Get.find<BrowseController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Movie App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/images/tmdb_short.svg',
                  height: 40,
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(1, 180, 228, 1),
                    BlendMode.srcIn,
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
              // TODO: moved browse page init data to the correct place
              _browseController.browseMedia();
            },
          ),
          ListTile(
            title: const Text('Favorites'),
            leading: const Icon(Icons.favorite),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FavoritesPage();
                  },
                ),
              );
              _favoritesController.getFavorites();
            },
          ),
        ],
      ),
    );
  }
}
