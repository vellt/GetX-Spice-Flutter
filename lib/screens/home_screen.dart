import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:spice/screens/products_view_screen.dart';
import 'package:spice/screens/calculating_screen.dart';
import 'package:spice/widgets/button_widget.dart';

import '../global.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: color.background,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: color.background,
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.sp),
                child: Text(
                  "Spice",
                  style: TextStyle(
                    color: color.mainText,
                    fontSize: 22.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Container(
                height: 21.sp,
                width: 40.sp,
                decoration: BoxDecoration(
                    color: color.red,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "v0.0.2",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      (color.isDarkMode) ? Icons.light_mode : Icons.dark_mode,
                      color: color.secondText,
                      size: 20.sp,
                    ),
                    onPressed: () => color.changeTheme(),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            ButtonWidget(
              function: () {
                Get.to(
                  CalculatingScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              leading: Icon(
                Icons.assignment_outlined,
                color: color.secondText,
                size: 20.sp,
              ),
              title: Text(
                "Fűszer kimérése",
                style: TextStyle(
                  color: color.secondText,
                  fontSize: 15.sp,
                ),
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: color.subText,
                size: 25.sp,
              ),
            ),
            ButtonWidget(
              function: () {
                Get.to(
                  ProductsViewScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              leading: Icon(
                Icons.list_alt,
                color: color.secondText,
                size: 20.sp,
              ),
              title: Text(
                "Termékek",
                style: TextStyle(
                  color: color.secondText,
                  fontSize: 15.sp,
                ),
              ),
              trailing: Icon(
                Icons.navigate_next,
                color: color.subText,
                size: 25.sp,
              ),
            ),
            ButtonWidget(
              function: () {},
              leading: Icon(
                Icons.save,
                color: color.secondText,
                size: 20.sp,
              ),
              title: Text(
                "Mentés készítése",
                style: TextStyle(
                  color: color.secondText,
                  fontSize: 15.sp,
                ),
              ),
              subtitle: Text(
                "Legutolsó mentés dátuma: 2022-04-02",
                style: TextStyle(
                  color: color.secondText,
                  fontSize: 10.sp,
                ),
              ),
            ),
            ButtonWidget(
              function: () {},
              leading: Icon(
                Icons.restore_outlined,
                color: color.secondText,
                size: 20.sp,
              ),
              title: Text(
                "Régebbi mentés visszaállítása",
                style: TextStyle(
                  color: color.secondText,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: Text(
                  "GitHub/vellt",
                  style: TextStyle(fontSize: 12.sp, color: color.secondText),
                ),
                onPressed: () {},
              ),
            ))
          ],
        ),
      );
    });
  }
}
