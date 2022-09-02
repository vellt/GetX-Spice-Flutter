import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/second_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../controllers/language_controller.dart';
import '../../global.dart';

class DataViewScreen extends StatelessWidget {
  DataViewScreen({Key? key, required this.controller}) : super(key: key) {}
  ProductController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: language,
        builder: (controllerLanguage) {
          return Scaffold(
            backgroundColor: color.background,
            appBar: AppBar(
              shadowColor: Colors.transparent.withOpacity(0.1),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: color.background,
              automaticallyImplyLeading: false,
              leading: IconButton(
                tooltip: controllerLanguage.otherBack,
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
                        child: FadeInUp(
                            duration: Duration(milliseconds: 500),
                            child:
                                MainTextWidget(controllerLanguage.dataHeader1)),
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 500),
                        child: LineWidget(),
                      ),
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
                    FadeInUp(
                        duration: Duration(milliseconds: 500),
                        child:
                            SecondTextWidget(controllerLanguage.dataHeader2)),
                    SizedBox(
                      height: 8.sp,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 500),
                      child: SubTextWidget(controllerLanguage.dataDescription1),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 500),
                      child: LineButtonWidget(
                        background: color.flatButton,
                        function: () {
                          controller.restore(context);
                        },
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
                              controllerLanguage.dataButton1,
                              style: TextStyle(
                                color: color.mainText,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 500),
                      child: LineWidget(),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 600),
                        child:
                            SecondTextWidget(controllerLanguage.dataHeader3)),
                    SizedBox(
                      height: 8.sp,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 600),
                      child: SubTextWidget(controllerLanguage.dataDescription2),
                    ),
                    SizedBox(height: 5.sp),
                    FadeInUp(
                      duration: Duration(milliseconds: 600),
                      child: LineButtonWidget(
                        background: color.blue,
                        function: () {
                          controller.makingBackup(context);
                        },
                        leading: Padding(
                          padding: EdgeInsets.only(left: 4.sp),
                          child: Icon(
                            CupertinoIcons.tray_arrow_down,
                            color: color.white,
                            size: 14.sp,
                          ),
                        ),
                        title: SizedBox(
                          height: 25.sp,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controllerLanguage.dataButton2,
                              style: TextStyle(
                                color: color.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 600),
                      child: LineWidget(),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 700),
                        child:
                            SecondTextWidget(controllerLanguage.dataHeader4)),
                    SizedBox(
                      height: 8.sp,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 700),
                      child: SubTextWidget(controllerLanguage.dataDescription3),
                    ),
                    SizedBox(height: 5.sp),
                    FadeInUp(
                      duration: Duration(milliseconds: 700),
                      child: LineButtonWidget(
                        background: color.flatButton,
                        function: () {
                          controller.delete();
                        },
                        leading: GetBuilder<ProductController>(builder: (cont) {
                          return Padding(
                            padding: EdgeInsets.only(left: 4.sp),
                            child: (cont.isDeleteInProgress)
                                ? SizedBox(
                                    height: 14.sp,
                                    width: 14.sp,
                                    child: CircularProgressIndicator(
                                      color: color.mainText,
                                      strokeWidth: 2.sp,
                                    ),
                                  )
                                : Icon(
                                    CupertinoIcons.delete,
                                    color: color.mainText,
                                    size: 14.sp,
                                  ),
                          );
                        }),
                        title: SizedBox(
                          height: 25.sp,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controllerLanguage.dataButton3,
                              style: TextStyle(
                                color: color.mainText,
                                fontSize: 12.sp,
                              ),
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
        });
  }
}
