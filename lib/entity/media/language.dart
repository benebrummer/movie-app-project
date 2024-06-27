import 'package:hive/hive.dart';

part 'language.g.dart';

@HiveType(typeId: 5)
class Language extends HiveObject {
  @HiveField(0)
  final String englishName;
  @HiveField(1)
  final String iso6391;
  @HiveField(2)
  final String name;

  Language({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'Language{englishName: $englishName, iso6391: $iso6391, name: $name}';
  }
}
