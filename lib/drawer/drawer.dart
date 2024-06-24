import 'package:flutter/material.dart';

import '../pages/search/search_page.dart';

class MovieAppDrawer extends StatelessWidget {
  const MovieAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Movie App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
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
            onTap: () {},
          ),
          ListTile(
            title: const Text('Favorites'),
            leading: const Icon(Icons.favorite),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
