import 'package:get/get.dart';
import 'package:spice/models/spice.dart';
import 'package:uuid/uuid.dart';

class SpiceController extends GetxController {
  List<Spice> _spices = <Spice>[];

  List<Spice> get spices => _spices;
  set spices(value) => _spices = value;

  addSpice({
    required String name,
    required double quantity,
  }) {
    _spices.add(Spice(
      name: name,
      quantity: quantity,
      id: Uuid().v1(),
    ));
    update();
  }

  deleteSpice({required String id}) {
    int index =
        _spices.indexOf(_spices.where((element) => element.id == id).first);
    _spices.removeAt(index);
    update();
  }

  updateSpice({required Spice spice}) {
    int index = _spices
        .indexOf(_spices.where((element) => element.id == spice.id).first);
    _spices[index] = spice;
    update();
  }
}
