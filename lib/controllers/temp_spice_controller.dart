import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:spice/models/component.dart';
import 'package:spice/models/product.dart';
import 'package:spice/models/spice.dart';
import 'package:uuid/uuid.dart';

class TempSpiceController extends GetxController {
  List<Spice> _spices = <Spice>[];

  get spices => _spices;

  addSpice(
      {required String name,
      required double quantity,
      required List<Component> components}) {
    var uuid = Uuid();
    _spices.add(Spice(
      id: uuid.v1(),
      name: name,
      quantity: quantity,
      components: components,
    ));
    update();
  }

  deleteSpice({required String id}) {
    int index =
        _spices.indexOf(_spices.where((element) => element.id == id).first);
    _spices.removeAt(index);
    update();
  }

  editSpice({required Spice spice}) {
    _spices.where((element) => element.id == spice.id).first.name = spice.name;
    _spices.where((element) => element.id == spice.id).first.quantity =
        spice.quantity;
    update();
  }

  addComponent({required String spiceId, required Component component}) {
    List<Component> currentComponent =
        _spices.where((element) => element.id == spiceId).first.components;
    currentComponent.add(component);
    _spices.where((element) => element.id == spiceId).first.components =
        currentComponent;
    update();
  }

  deleteComponent({required String spiceID, required String componentID}) {
    List<Component> temp =
        _spices.where((element) => element.id == spiceID).first.components;
    int index =
        temp.indexOf(temp.where((element) => element.id == componentID).first);
    _spices
        .where((element) => element.id == spiceID)
        .first
        .components
        .removeAt(index);
    update();
  }

  updateComponent({required String spiceID, required Component component}) {
    _spices
        .where((element) => element.id == spiceID)
        .first
        .components
        .where((element) => element.id == component.id)
        .first
        .quantity = component.quantity;
    _spices
        .where((element) => element.id == spiceID)
        .first
        .components
        .where((element) => element.id == component.id)
        .first
        .name = component.name;
    update();
  }
}
