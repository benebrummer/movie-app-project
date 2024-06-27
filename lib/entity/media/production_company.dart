import 'package:hive/hive.dart';

part 'production_company.g.dart';

@HiveType(typeId: 3)
class ProductionCompany extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String logoPath;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logoPath: json['logo_path'] ?? '',
      name: json['name'] ?? '',
      originCountry: json['origin_country'] ?? '',
    );
  }

  @override
  String toString() {
    return 'ProductionCompany{id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry}';
  }
}
