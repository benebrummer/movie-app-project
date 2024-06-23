class Network {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Network.fromJson(Map<dynamic, dynamic> json) {
    return Network(
      id: json['id'],
      logoPath: json['logo_path'] ?? '',
      name: json['name'] ?? '',
      originCountry: json['origin_country'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Network{id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry}';
  }
}
