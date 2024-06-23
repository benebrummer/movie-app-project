class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<dynamic, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'Genre{id: $id, name: $name}';
  }
}
