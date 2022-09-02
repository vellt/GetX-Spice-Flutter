import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/screens/products/products_add_screen.dart';
import 'package:spice/screens/products/products_edit_screen.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/second_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../controllers/language_controller.dart';
import '../../global.dart';

class ProductsViewScreen extends StatelessWidget {
  ProductsViewScreen({Key? key, required this.controller}) : super(key: key) {}
  ProductController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: language,
        builder: (controller2) {
          return Scaffold(
            backgroundColor: color.background,
            appBar: AppBar(
              shadowColor: Colors.transparent.withOpacity(0.1),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: color.background,
              automaticallyImplyLeading: false,
              leading: IconButton(
                tooltip: controller2.otherBack,
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
                    padding: EdgeInsets.only(left: 15.sp),
                    child: Column(
                      children: [
                        FadeInUp(
                          duration: Duration(milliseconds: 500),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child:
                                MainTextWidget(controller2.productViewHeader1),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 500),
                          child: LineWidget(),
                        ),
                      ],
                    )),
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: 8.sp, right: 15.sp, left: 15.sp),
                child: Column(
                  children: [
                    FadeInUp(
                      duration: Duration(milliseconds: 500),
                      child: SubTextWidget(controller2.productViewDescription1),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 500),
                      child: LineButtonWidget(
                        background: color.blue,
                        function: () {
                          Get.to(
                              () => ProductsAddScreen(
                                    controller: controller,
                                  ),
                              transition: Transition.rightToLeft);
                        },
                        leading: Icon(
                          CupertinoIcons.add,
                          color: color.white,
                          size: 14.sp,
                        ),
                        title: SizedBox(
                          height: 25.sp,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller2.productViewButton1,
                              style: TextStyle(
                                color: color.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: color.mainArrow,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 500),
                      child: LineWidget(),
                    ),
                    SizedBox(height: 3.sp),
                    FadeInUp(
                        duration: Duration(milliseconds: 600),
                        child:
                            SecondTextWidget(controller2.productViewHeader2)),
                    SizedBox(height: 5.sp),
                    FadeInUp(
                      duration: Duration(milliseconds: 600),
                      child: SubTextWidget(controller2.productViewDescription2),
                    ),
                    SizedBox(height: 5.sp),
                    GetBuilder<ProductController>(builder: (cont) {
                      if (cont.product.length == 0) {
                        return Container(
                          height: 150.sp,
                          child: Center(
                              child: Text(
                            controller2.noProduct,
                            style: TextStyle(
                                color: color.subText, fontSize: 10.sp),
                          )),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cont.product.length,
                            itemBuilder: (context, index) {
                              Product product = cont.product.getAt(index);
                              return FadeInUp(
                                duration:
                                    Duration(milliseconds: (index * 100 + 600)),
                                child: LineButtonWidget(
                                  function: () {
                                    Get.to(
                                        () => ProductsEditScreen(
                                              product: product,
                                              controller: controller,
                                            ),
                                        transition: Transition.cupertino);
                                  },
                                  title: SizedBox(
                                    height: 25.sp,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(product.name,
                                          style: TextStyle(
                                            color: color.secondText,
                                            fontSize: 12.sp,
                                          )),
                                    ),
                                  ),
                                  background: color.flatButton,
                                  trailing: Icon(
                                    Icons.navigate_next,
                                    color: color.subArrow,
                                    size: 20.sp,
                                  ),
                                ),
                              );
                            });
                      }
                    })
                  ],
                ),
              ),
            ),
          );
        });
  }
}
