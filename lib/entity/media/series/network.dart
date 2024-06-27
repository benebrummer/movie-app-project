import 'package:hive/hive.dart';

part 'network.g.dart';

@HiveType(typeId: 9)
class Network {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String logoPath;
  @HiveField(2)
  final String name;
  @HiveField(3)
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
