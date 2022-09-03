import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/language_controller.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../global.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: language,
        builder: (controller) {
          return Scaffold(
            backgroundColor: color.background,
            appBar: AppBar(
              shadowColor: Colors.transparent.withOpacity(0.1),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: color.background,
              automaticallyImplyLeading: false,
              leading: IconButton(
                tooltip: controller.otherBack,
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
                      FadeInUp(
                        duration: Duration(milliseconds: 500),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: MainTextWidget(controller.languageHeader),
                        ),
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
                      child: SubTextWidget(controller.languageDescription),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 600),
                      child: LineButtonWidget(
                        background: (controller.isHungarian)
                            ? color.blue
                            : color.flatButton,
                        function: () {
                          controller.changeLanguage(isHungarian: true);
                        },
                        leading: Padding(
                          padding: EdgeInsets.only(left: 4.sp),
                          child: Icon(
                            (controller.isHungarian)
                                ? CupertinoIcons.check_mark_circled
                                : CupertinoIcons.circle,
                            color: (controller.isHungarian)
                                ? color.white
                                : color.mainText,
                            size: 14.sp,
                          ),
                        ),
                        title: SizedBox(
                          height: 25.sp,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.languageButton1,
                              style: TextStyle(
                                color: (controller.isHungarian)
                                    ? color.white
                                    : color.mainText,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 700),
                      child: LineButtonWidget(
                        background: !(controller.isHungarian)
                            ? color.blue
                            : color.flatButton,
                        function: () {
                          controller.changeLanguage(isHungarian: false);
                        },
                        leading: Padding(
                          padding: EdgeInsets.only(left: 4.sp),
                          child: Icon(
                            !(controller.isHungarian)
                                ? CupertinoIcons.check_mark_circled
                                : CupertinoIcons.circle,
                            color: !(controller.isHungarian)
                                ? color.white
                                : color.mainText,
                            size: 14.sp,
                          ),
                        ),
                        title: SizedBox(
                          height: 25.sp,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.languageButton2,
                              style: TextStyle(
                                color: !(controller.isHungarian)
                                    ? color.white
                                    : color.mainText,
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
