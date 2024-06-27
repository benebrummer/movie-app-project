import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/browse_controller.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: GetBuilder<BrowseController>(
            builder: (controller) {
              return ToggleButtons(
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                    minWidth: 100.0,
                  ),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold), color: Colors.amber,
                  onPressed: (int index) {
                    controller.updateSelectedCategory(index);
                    debugPrint(controller.selectedCategory.toString());
                  },
                  isSelected: controller.selectedCategories,
                  children: controller.browseCategories
                      .map(((BrowseCategory, String) category) =>
                          Text(category.$2))
                      .toList());
            },
          ),
        )
      ]
    );
  }
}