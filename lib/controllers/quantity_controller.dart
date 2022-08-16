import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuantityController extends GetxController {
  double _quantity = 0.0;
  double get quantity => _quantity;
  change({required double value}) {
    _quantity = value;
    update();
  }
}
