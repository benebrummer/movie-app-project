import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:movie_app_project/entity/media/review/author_details.dart';
import 'package:movie_app_project/entity/media/review/review.dart';
import 'package:movie_app_project/pages/reviews/widgets/review_list_item.dart';

void main() {
  testWidgets('Single review list tile test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final Review testReview = _createReview();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return ReviewListTile(review: testReview);
            },
          ),
        ),
      ),
    );

    expect(find.byType(ReviewListTile), findsOneWidget);
    expect(find.byType(ClipOval), findsOneWidget);
    expect(find.text(testReview.author), findsOneWidget);
    expect(find.text('10.0 / 10.0'), findsOneWidget);
    expect(find.text(testReview.content), findsOneWidget);
    expect(find.text('Created at: ${_formatDateTime(testReview.createdAt)}'),
        findsOneWidget);
    expect(find.text('Updated at: ${_formatDateTime(testReview.updatedAt)}'),
        findsOneWidget);
  });
}

Review _createReview() {
  return Review(
    id: '1',
    author: 'author',
    content: 'content',
    url: '',
    authorDetails: AuthorDetails(
        name: 'author', username: 'username', avatarPath: '', rating: 10.0),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

String _formatDateTime(final DateTime dateTime) {
  DateFormat formatter = DateFormat('yyyy/MM/dd HH:mm');
  return formatter.format(dateTime);
}
