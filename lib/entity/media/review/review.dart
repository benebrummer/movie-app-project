import 'author_details.dart';

class Review {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;
  final String url;

  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'] ?? '',
      authorDetails: AuthorDetails.fromJson(json['author_details']),
      content: json['content'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'] ?? 0,
      updatedAt: DateTime.parse(json['updated_at']),
      url: json['url'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Review{author: $author, authorDetails: $authorDetails, content: $content, createdAt: $createdAt, id: $id, updatedAt: $updatedAt, url: $url}';
  }
}
