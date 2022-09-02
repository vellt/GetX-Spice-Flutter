import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:spice/models/spice.dart';
import 'package:spice/screens/home/home_screen.dart';
import 'global.dart';
import 'models/product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //hivedb
  await GetStorage.init(); //getstoreg
  await Hive.initFlutter(); //hivedb
  //for adapter generating: flutter packages pub run build_runner build
  Hive.registerAdapter(SpiceAdapter()); //hive (after generate adapter)
  Hive.registerAdapter(ProductAdapter()); //hive (after generate adapter)

  await Hive.openBox<Product>('products'); //hive (after generate adapter)
  quantity.onInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return SimpleBuilder(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spice',
          theme: color.currentTheme,
          home: HomeScreen(),
        );
      });
    });
  }
}
