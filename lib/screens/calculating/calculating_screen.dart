import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/tab_controller.dart';
import 'package:sizer/sizer.dart';
import '../../global.dart';

class CalculatingScreen extends StatelessWidget {
  CalculatingScreen({required this.tabIndex}) {
    tabs.setInitialIndex(tabIndex);
  }
  final MyTabController tabs = Get.put(MyTabController());
  final int tabIndex;
  @override
  Widget build(BuildContext context) {
    if (tabs.myTabs.length == 0) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20.sp,
              color: color.mainText,
            ),
            onPressed: () => Get.back(),
          ),
          shadowColor: Colors.transparent,
          backgroundColor: color.background,
        ),
        body: Container(
          color: color.background,
          child: Center(
              child: Text("Nincs termék",
                  style: TextStyle(color: color.subText, fontSize: 10.sp))),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: color.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20.sp,
              color: color.mainText,
            ),
            onPressed: () => Get.back(),
          ),
          shadowColor: Colors.transparent,
          backgroundColor: color.background,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.sp),
            child: Column(
              children: [
                TabBar(
                  controller: tabs.controller,
                  tabs: tabs.myTabs,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  physics: BouncingScrollPhysics(),
                  labelStyle:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                  labelColor: color.mainText,
                  unselectedLabelStyle:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  unselectedLabelColor: color.subText,
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.transparent;
                  }),
                ),
                Container(
                  height: 70.sp,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 14.sp, vertical: 10.sp),
                    child: TextFormField(
                      initialValue: (quantity.quantity.toString() != "0.0")
                          ? quantity.quantity.toString()
                          : null,
                      autofocus: true,
                      cursorColor: color.mainText,
                      style: TextStyle(fontSize: 16.sp),
                      textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.numberWithOptions(),
                      onChanged: (value) {
                        print(value);
                        if (double.tryParse(value) != null) {
                          quantity.change(value: double.parse(value));
                        } else {
                          quantity.change(value: double.parse("0.0"));
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        if (double.parse(value).isNaN) {
                          return 'Invalid number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 15.sp,
                            right: 10.sp,
                            top: 18.sp,
                            bottom: 12.sp),
                        labelStyle: TextStyle(color: color.subText),
                        labelText: 'Súly',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: color.subArrow, width: 1.5.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: color.subArrow,
                              width: 1.5
                                  .sp), //todo: mas legyen a szine mikor nem aktiv
                        ),
                        suffixIcon: Container(
                          height: 20.sp,
                          width: 40.sp,
                          child: Center(
                            child: Text(
                              "Kg",
                              style: TextStyle(
                                  color: color.subText, fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: tabs.controller,
          children: tabs.tabContent,
          physics: BouncingScrollPhysics(),
        ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("index: ${tabs.controller.index}");
          },
          child: Icon(
            Icons.add,
            color: color.mainText,
          ),
          backgroundColor: color.blue,
        ),*/
      );
    }
  }
}
