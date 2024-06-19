import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<MediaSearchController>(
          init: MediaSearchController(),
          builder: (controller) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.updateSelectedCategory(SearchCategory.movies);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: controller.selectedCategory == SearchCategory.movies ? Colors.blue : Colors.white,),
                    child: const Text('Movies'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.updateSelectedCategory(SearchCategory.tvShows);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: controller.selectedCategory == SearchCategory.tvShows ? Colors.blue : Colors.white,),
                    child: const Text('TV Shows'),
                  ),
                ),
              ],
            );
          }
        ),
        const SizedBox(height: 20),
        DropdownButton(
          items: <String>['Movies', 'TV Shows'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {},
          value: 'Movies',
        ),
        const SizedBox(height: 20),
        const DropdownMenu(
          expandedInsets: EdgeInsets.zero,
          // TODO: enum
          initialSelection: 'movies',
          dropdownMenuEntries: [
            DropdownMenuEntry<String>(
              value: 'movies',
              label: 'Movies',
            ),
            DropdownMenuEntry<String>(
              value: 'tv_shows',
              label: 'TV Shows',
            ),
          ],
        ),
        const SizedBox(height: 20),
        SearchBar(
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {

              },
            ),
          ],
          hintText: 'Search _category_',
        ),
      ],
    );
  }
}
