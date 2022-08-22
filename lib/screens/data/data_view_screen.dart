import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/data_controller.dart';
import 'package:spice/widgets/button_widget.dart';
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
          preferredSize: Size.fromHeight(50.sp),
          child: Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Mentés készítése és visszaállítása",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.sp),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.sp),
              child: Text(
                "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából vagy a fájrendszerből az importálásra kattintva",
                style: TextStyle(fontSize: 11.sp, color: color.subText),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            ButtonWidget(
              function: () {},
              leading: Icon(
                Icons.circle,
                color: color.secondText,
                size: 10.sp,
              ),
              trailing: Padding(
                  padding: EdgeInsets.only(right: 10.sp),
                  child: Text(
                    "2022-01-10",
                    style: TextStyle(
                      color: color.secondText,
                      fontSize: 13.sp,
                    ),
                  )),
              title: SizedBox(
                height: 25.sp,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Mentés1",
                      style: TextStyle(
                        color: color.secondText,
                        fontSize: 13.sp,
                      )),
                ),
              ),
            ),
            ButtonWidget(
              function: () {},
              trailing: Padding(
                  padding: EdgeInsets.only(right: 10.sp),
                  child: Text(
                    "2022-01-10",
                    style: TextStyle(
                      color: color.inputBorder,
                      fontSize: 13.sp,
                    ),
                  )),
              title: SizedBox(
                height: 25.sp,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Mentés1",
                      style: TextStyle(
                        color: color.inputBorder,
                        fontSize: 13.sp,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.sp),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Divider(
                      thickness: 1.sp,
                      color: color.mainButton,
                    ),
                  ),
                  SizedBox(width: 5.sp),
                  Text(
                    "vagy",
                    style: TextStyle(fontSize: 11.sp, color: color.secondText),
                  ),
                  SizedBox(width: 5.sp),
                  Flexible(
                    child: Divider(
                      thickness: 1.sp,
                      color: color.mainButton,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            ButtonWidget(
              function: () {},
              leading: Icon(
                Icons.folder,
                color: color.secondText,
                size: 17.sp,
              ),
              title: SizedBox(
                height: 25.sp,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Importálás",
                      style: TextStyle(
                        color: color.mainText,
                        fontSize: 13.sp,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.save,
          color: color.mainText,
        ),
        backgroundColor: color.mainButton,
      ),
    );
  }
}
