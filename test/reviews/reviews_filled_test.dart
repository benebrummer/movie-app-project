import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_project/api/repository/tmdb_repository.dart';
import 'package:movie_app_project/controller/review_controller.dart';
import 'package:movie_app_project/entity/media/review/author_details.dart';
import 'package:movie_app_project/entity/media/review/review.dart';
import 'package:movie_app_project/pages/reviews/reviews_page.dart';
import 'package:movie_app_project/pages/reviews/widgets/review_list_item.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'reviews_page_test.mocks.dart';

@GenerateMocks([MediaRepository])
void main() {
  setUp(() async {
    final mockMediaRepository = MockMediaRepository();
    Get.put(ReviewController(mediaRepository: mockMediaRepository));
    when(mockMediaRepository.getMovieReviews(1))
        .thenAnswer((_) async => _createReviews());
  });

  testWidgets('Review page is scrollable', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.find<ReviewController>().fetchReviews(1, MediaType.movie);
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewsPage(
          title: 'test movie',
        ),
      ),
    );
    expect(find.byType(Scrollable), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0.0, -5000.0));
    await tester.pumpAndSettle();
  });

  testWidgets('Reviews page test with a list of reviews',
      (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.find<ReviewController>().fetchReviews(1, MediaType.movie);
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewsPage(
          title: 'test movie',
        ),
      ),
    );
    expect(find.text('Reviews: test movie'), findsOneWidget);
    final beforeScroll = find.byType(ReviewListTile).first;
    await tester.drag(find.byType(ListView), const Offset(0.0, -5000.0));
    await tester.pumpAndSettle();
    final afterScroll = find.byType(ReviewListTile).first;
    expect(find.byType(ReviewListTile), findsAtLeast(2));
    expect(beforeScroll, isNot(afterScroll));
  });
}

List<Review> _createReviews() {
  final List<Review> reviews = [];
  for (int i = 0; i < 10; i++) {
    final Review review = Review(
      id: '$i',
      author: 'author$i',
      content: 'content$i',
      url: 'url',
      authorDetails: AuthorDetails(
          name: 'name', username: 'username', avatarPath: '', rating: 10.0),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    reviews.add(review);
  }
  return reviews;
}
