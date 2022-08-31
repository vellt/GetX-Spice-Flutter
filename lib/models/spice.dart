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

  Spice.fromJson(Map<String, dynamic> json)
      : id = json['i'],
        name = json['n'],
        quantity = json['q'];

  Map<String, dynamic> toJson() {
    return {
      'i': id,
      'n': name,
      'q': quantity,
    };
  }
}
