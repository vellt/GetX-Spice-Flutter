import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/screens/calculating/tabScreen.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;
  ProductController productController = Get.put(ProductController());
  int initialIndex = 0;

  void setInitialIndex(int index) {
    controller.index = index;
    update();
  }

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
      tabContent.add(TabScreen(
        product: productController.product.getAt(i),
      ));
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