import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/search_controller.dart';

class MediaSearchWidget extends StatelessWidget {
  const MediaSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<MediaSearchController>(
          builder: (controller) {
            return SearchBar(
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
              ],
              hintText: 'Search ${controller.currentlySelected}',
              onSubmitted: (String value) {
                if (value.isEmpty) return;
                controller.searchMedia(value);
              },
              onChanged: (String value) {
                controller.searchQuery = value;
              },
            );
          },
        ),
        const SizedBox(height: 20),
        Center(
          child: GetBuilder<MediaSearchController>(
            builder: (controller) {
              return ToggleButtons(
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                    minWidth: 100.0,
                  ),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  onPressed: (int index) {
                    controller.updateSelectedCategory(index);
                  },
                  isSelected: controller.selectedCategories,
                  children: controller.searchCategories
                      .map(((SearchCategory, String) category) =>
                          Text(category.$2))
                      .toList());
            },
          ),
        ),
      ],
    );
  }
}
