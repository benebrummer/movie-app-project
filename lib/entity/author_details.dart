class AuthorDetails {
  final String name;
  final String username;
  final String avatarPath;
  final double? rating;

  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      avatarPath: json['avatar_path'] ?? '',
      rating: json['rating'],
    );
  }

  @override
  String toString() {
    return 'AuthorDetails{name: $name, username: $username, avatarPath: $avatarPath, rating: $rating}';
  }
}
