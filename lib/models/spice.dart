import 'package:hive/hive.dart';

part 'spice.g.dart';

@HiveType(typeId: 1)
class Spice extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  double quantity;
  Spice({
    required this.id,
    required this.name,
    required this.quantity,
  });
}
