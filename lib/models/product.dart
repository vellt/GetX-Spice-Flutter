import 'package:spice/models/spice.dart';
import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double quantity; //default 0
  @HiveField(2)
  final List<Spice> spices;
  Product({
    required this.name,
    required this.quantity,
    required this.spices,
  });
}
