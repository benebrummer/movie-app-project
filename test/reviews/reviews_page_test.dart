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

import 'movie_details_page_test.mocks.dart';

@GenerateMocks([MediaRepository])
void main() {
  setUp(() async {
    final mockMediaRepository = MockMediaRepository();
    Get.put(ReviewController(mediaRepository: mockMediaRepository));
    when(mockMediaRepository.getMovieReviews(1)).thenAnswer((_) async => [
          Review(
            id: '1',
            author: 'author',
            content: 'content',
            url: 'url',
            authorDetails: AuthorDetails(
                name: '', username: '', avatarPath: '', rating: null),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          )
        ]);
  });

  testWidgets('Reviews page test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.find<ReviewController>().fetchReviews(1, MediaType.movie);
    await tester.pumpWidget(
      MaterialApp(
        home: ReviewsPage(
          title: 'test movie',
        ),
      ),
    );
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Reviews: test movie'), findsOneWidget);
    expect(find.byType(ReviewListTile), findsOneWidget);
  });
}
