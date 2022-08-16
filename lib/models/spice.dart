import 'component.dart';
import 'package:hive/hive.dart';

part 'spice.g.dart';

@HiveType(typeId: 1)
class Spice extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double quantity;
  @HiveField(2)
  List<Component> components;
  Spice({
    required this.name,
    required this.quantity,
    required this.components,
  });
}
