import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ColorController extends GetxController {
  Color get red => (!isDarkMode) ? Color(0xFFD63D3D) : Color(0xFFA82828);

  Color get blue => (!isDarkMode) ? Color(0xFF3091FF) : Color(0xFF1355C6);

  Color get mainText => (!isDarkMode) ? Colors.black : Colors.white;

  Color get secondText => (!isDarkMode) ? Color(0xFF131313) : Color(0xFFEBEBEB);

  Color get subText => (!isDarkMode) ? Color(0xFF888888) : Color(0xFF707070);

  Color get flatButton => (!isDarkMode) ? Color(0xFFF3F3F3) : Color(0xFF212121);

  Color get background => (!isDarkMode) ? Colors.white : Colors.black;

  Color get line => (!isDarkMode) ? Color(0xFFF5F5F5) : Color(0xFF272727);

  Color get subArrow => (!isDarkMode) ? Color(0xFFBFBFBF) : Color(0xFF818181);

  Color get bigButton => (!isDarkMode) ? Color(0xFFDCDCDC) : Color(0xFF565656);

  Color get mainArrow => (!isDarkMode) ? Color(0xFFE3E3E3) : Color(0xFFDEDEDE);

  Color get white => Colors.white;

  RxBool _isDarkMode = false.obs;
  final _box = GetStorage();
  bool get isDarkMode => _isDarkMode.value;
  ThemeData get currentTheme =>
      isDarkMode ? ThemeData.dark() : ThemeData.light();

  void changeTheme() {
    Get.changeThemeMode((isDarkMode) ? ThemeMode.light : ThemeMode.dark);
    _isDarkMode.value = !isDarkMode;
    _box.write('darkmode', isDarkMode);
  }

  @override
  void onInit() {
    super.onInit();
    _isDarkMode.value = _box.read('darkmode') ?? false;
    ever(_isDarkMode, (_) => print("is dark mode on: $_"));
  }
}
