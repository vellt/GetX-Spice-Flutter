import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/data_controller.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/second_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../global.dart';

class DataViewScreen extends StatelessWidget {
  DataViewScreen({Key? key}) : super(key: key) {}
  DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.background,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: color.mainText,
          ),
          onPressed: () => Get.back(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.sp),
          child: Padding(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MainTextWidget("Adatok kezelése"),
                ),
                LineWidget(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 5.sp, right: 14.sp, left: 14.sp),
          child: Column(
            children: [
              SecondTextWidget("Mentés visszaállítása"),
              SizedBox(
                height: 8.sp,
              ),
              SubTextWidget(
                  "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából vagy a fájrendszerből az importálásra kattintva"),
              SizedBox(
                height: 5.sp,
              ),
              LineButtonWidget(
                background: color.flatButton,
                function: () {},
                leading: Padding(
                  padding: EdgeInsets.only(left: 4.sp),
                  child: Icon(
                    CupertinoIcons.folder,
                    color: color.mainText,
                    size: 14.sp,
                  ),
                ),
                title: SizedBox(
                  height: 25.sp,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tallózás a könyvtárból",
                      style: TextStyle(
                        color: color.mainText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
              LineWidget(),
              SizedBox(
                height: 5.sp,
              ),
              SecondTextWidget("Mentés készítése"),
              SizedBox(
                height: 8.sp,
              ),
              SubTextWidget(
                  "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából vagy a fájrendszerből"),
              SizedBox(height: 5.sp),
              LineButtonWidget(
                background: color.blue,
                function: () {},
                leading: Padding(
                  padding: EdgeInsets.only(left: 4.sp),
                  child: Icon(
                    CupertinoIcons.tray_arrow_down,
                    color: color.mainText,
                    size: 14.sp,
                  ),
                ),
                title: SizedBox(
                  height: 25.sp,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mentés készítése",
                      style: TextStyle(
                        color: color.mainText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              LineWidget(),
              SizedBox(
                height: 5.sp,
              ),
              SecondTextWidget("Adatok törlése"),
              SizedBox(
                height: 8.sp,
              ),
              SubTextWidget(
                  "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából vagy a fájrendszerből"),
              SizedBox(height: 5.sp),
              LineButtonWidget(
                background: color.flatButton,
                function: () {},
                leading: Padding(
                  padding: EdgeInsets.only(left: 4.sp),
                  child: Icon(
                    CupertinoIcons.delete,
                    color: color.mainText,
                    size: 14.sp,
                  ),
                ),
                title: SizedBox(
                  height: 25.sp,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Adatok törlése",
                      style: TextStyle(
                        color: color.mainText,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
