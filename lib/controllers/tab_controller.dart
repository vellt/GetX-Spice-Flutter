import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/screens/tabScreen.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;
  ProductController productController = Get.put(ProductController());

  List<Tab> _getProductName() {
    List<Tab> names = [];
    for (var product in productController.product.values) {
      names.add(Tab(
        text: product.name,
      ));
    }
    return names;
  }

  List<Tab> myTabs = [];

  List<Widget> tabContent = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    myTabs = _getProductName();
    for (var i = 0; i < myTabs.length; i++) {
      tabContent.add(ScreenOne());
    }
    controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}
