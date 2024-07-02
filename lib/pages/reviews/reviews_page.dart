import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/pages/reviews/widgets/review_list_item.dart';

import '../../controller/review_controller.dart';

class ReviewsPage extends StatelessWidget {
  final String title;
  ReviewsPage({super.key, required this.title});

  final ReviewController _reviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews: $title'),
      ),
      body: SafeArea(
        child: Obx(
          () => _reviewController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : _reviewController.reviews.isEmpty
                  ? const Center(child: Text('No reviews found'))
                  : ListView.builder(
                      itemCount: _reviewController.reviews.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final review = _reviewController.reviews[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ReviewListTile(review: review),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
