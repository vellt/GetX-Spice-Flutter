import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/screens/tabScreen.dart';

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "Disznósajt",
    ),
    Tab(
      text: "Hurka",
    ),
    Tab(
      text: "Sütőkolbász (Csemege)",
    ),
  ];

  List<Widget> tabContent = [
    ScreenOne(),
    ScreenOne(),
    ScreenOne(),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}
