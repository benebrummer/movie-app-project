import 'package:hive/hive.dart';

part 'genre.g.dart';

@HiveType(typeId: 2)
class Genre extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
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
