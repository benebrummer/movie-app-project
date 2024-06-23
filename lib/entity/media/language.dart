class Language {
  final String englishName;
  final String iso6391;
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
