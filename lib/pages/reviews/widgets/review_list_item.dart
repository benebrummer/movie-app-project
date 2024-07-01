import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../entity/media/review/review.dart';

class ReviewListTile extends StatelessWidget {
  final Review review;
  const ReviewListTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      title: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: review.authorDetails.avatarPath.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : Image.network(
                        'https://image.tmdb.org/t/p/w200/${review.authorDetails.avatarPath}',
                        width: 50,
                        height: 50,
                      ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.author,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 5),
                      Text(
                        '${review.authorDetails.rating == null ? '-' : review.authorDetails.rating.toString()} / 10',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
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
    );
  }

  String _formatDateTime(final DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy/MM/dd HH:mm');
    return formatter.format(dateTime);
  }
}
