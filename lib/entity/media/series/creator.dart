import 'package:hive/hive.dart';

part 'creator.g.dart';

@HiveType(typeId: 7)
class Creator {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String creditId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int gender;
  @HiveField(4)
  final String profilePath;

  Creator({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  factory Creator.fromJson(Map<dynamic, dynamic> json) {
    return Creator(
      id: json['id'],
      creditId: json['credit_id'],
      name: json['name'] ?? '',
      gender: json['gender'] ?? 0,
      profilePath: json['profile_path'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Creator{id: $id, creditId: $creditId, name: $name, gender: $gender, profilePath: $profilePath}';
  }
}
