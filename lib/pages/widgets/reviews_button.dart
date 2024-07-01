import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/review_controller.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../reviews/reviews_page.dart';

class ReviewsButton extends StatelessWidget {
  final String title;
  final int mediaId;
  final MediaType mediaType;
  ReviewsButton(
      {super.key,
      required this.mediaId,
      required this.mediaType,
      required this.title});

  final ReviewController _reviewsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            _reviewsController.fetchReviews(mediaId, mediaType);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewsPage(title: title),
              ),
            );
          },
          child: const Text(
            'Reviews',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
