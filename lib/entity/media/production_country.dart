import 'package:hive/hive.dart';

part 'production_country.g.dart';

@HiveType(typeId: 4)
class ProductionCountry extends HiveObject {
  @HiveField(0)
  final String iso31661;
  @HiveField(1)
  final String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'ProductionCountry{iso31661: $iso31661, name: $name}';
  }
}
