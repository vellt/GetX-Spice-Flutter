import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../boxes/color_box.dart';

enum Themes {
  light,
  dark,
  next,
}

class ThemeController extends GetxController {
  late ColorBox color;

  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Status bar
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Status bar
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );

  RxBool _isDarkMode = false.obs;
  final _box = GetStorage();
  bool get isDarkMode => _isDarkMode.value;

  void setTheme({required Themes theme}) {
    if (theme == Themes.next) {
      _isDarkMode.value = !isDarkMode;
      setTheme(theme: (isDarkMode) ? Themes.dark : Themes.light);
    } else {
      _isDarkMode.value = (theme == Themes.dark);
      Get.changeThemeMode((isDarkMode) ? ThemeMode.dark : ThemeMode.light);
      _box.write('darkmode', isDarkMode);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _isDarkMode.listen((p0) {
      print("is dark mode on: $p0");
      color = ColorBox(isDarkMode);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: color.background,
        systemNavigationBarIconBrightness:
            (p0) ? Brightness.light : Brightness.dark,
      ));
    });
    _isDarkMode.value = _box.read('darkmode') ?? false;
    //ever(_isDarkMode, (_) => );
    setTheme(theme: (_isDarkMode.value) ? Themes.dark : Themes.light);
    color = ColorBox(isDarkMode);
  }
}
