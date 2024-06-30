import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/review_controller.dart';

class ReviewsPage extends StatelessWidget {
  final String title;
  ReviewsPage({super.key, required this.title});

  final ReviewController _reviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: add paging but most of the time reviews are not that many
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews: $title'),
      ),
      body: Obx(
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
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(20),
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: review
                                              .authorDetails.avatarPath.isEmpty
                                          ? const Icon(Icons.person, size: 50)
                                          : Image.network(
                                              'https://image.tmdb.org/t/p/w200/${review.authorDetails.avatarPath}',
                                              width: 50,
                                              height: 50,
                                            ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review.author,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rating: ${review.authorDetails.rating == null ? '-' : review.authorDetails.rating.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Divider(),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(review.content),
                                  const SizedBox(height: 10),
                                  const Divider(),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Created at: ${_formatDateTime(review.createdAt)}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'Updated at: ${_formatDateTime(review.updatedAt)}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }

  String _formatDateTime(final DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy/MM/dd HH:mm');
    return formatter.format(dateTime);
  }
}
