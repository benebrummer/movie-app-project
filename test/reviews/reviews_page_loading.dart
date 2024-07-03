import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app_project/api/repository/tmdb_repository.dart';
import 'package:movie_app_project/controller/review_controller.dart';
import 'package:movie_app_project/pages/reviews/reviews_page.dart';

import 'reviews_page_test.mocks.dart';

@GenerateMocks([MediaRepository])
void main() {
  setUp(() async {
    final mockMediaRepository = MockMediaRepository();
    Get.put(ReviewController(mediaRepository: mockMediaRepository));
  });

  testWidgets('Loading state and empty reviews', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final ReviewController reviewController = Get.find<ReviewController>();
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewsPage(
          title: 'test movie',
        ),
      ),
    );

    reviewController.isLoading = true;
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    reviewController.isLoading = false;
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('No reviews found'), findsOneWidget);
  });
}
