class Creator {
  final int id;
  final String creditId;
  final String name;
  final int gender;
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
