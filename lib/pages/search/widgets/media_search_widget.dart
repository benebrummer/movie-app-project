import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../controller/search_controller.dart';

class MediaSearchWidget extends StatelessWidget {
  MediaSearchWidget({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<MediaSearchController>(
          builder: (controller) {
            return SearchBar(
              controller: _textEditingController,
              leading: const Icon(Icons.search),
              hintText: 'Search ${controller.getSelectedMediaTypeString()}',
              trailing: <Widget>[
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _textEditingController.clear();
                  },
                ),
              ],
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
                  isSelected: controller.selectedMediaTypes,
                  children: controller.searchMediaTypes
                      .map(((MediaType, String) category) => Text(category.$2))
                      .toList());
            },
          ),
        ),
      ],
    );
  }
}
