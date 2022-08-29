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
import '../../global.dart';

class ProductsViewScreen extends StatelessWidget {
  ProductsViewScreen({Key? key, required this.controller}) : super(key: key) {}
  ProductController controller;

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
              padding: EdgeInsets.only(left: 15.sp),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: MainTextWidget("Termékek"),
                  ),
                  LineWidget(),
                ],
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.sp, right: 15.sp, left: 15.sp),
        child: Column(
          children: [
            SubTextWidget(
                "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából"),
            SizedBox(
              height: 5.sp,
            ),
            LineButtonWidget(
              background: color.blue,
              function: () {
                Get.to(
                    () => ProductsAddScreen(
                          controller: controller,
                        ),
                    transition: Transition.rightToLeft);
              },
              leading: Padding(
                padding: EdgeInsets.only(left: 4.sp),
                child: Icon(
                  CupertinoIcons.add,
                  color: color.mainText,
                  size: 14.sp,
                ),
              ),
              title: SizedBox(
                height: 25.sp,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Termék hozzáadása",
                    style: TextStyle(
                      color: color.mainText,
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
            LineWidget(),
            SizedBox(height: 3.sp),
            SecondTextWidget("Termék szerkesztése"),
            SizedBox(height: 5.sp),
            SubTextWidget(
                "Régebbi állapot visszaállításához válaszd ki azadott mentést a listából"),
            SizedBox(height: 5.sp),
            Expanded(
              child: GetBuilder<ProductController>(builder: (cont) {
                if (cont.product.length == 0) {
                  return Center(
                      child: Text(
                    "Nincs termék",
                    style: TextStyle(color: color.subText, fontSize: 10.sp),
                  ));
                } else {
                  return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: cont.product.length,
                      itemBuilder: (context, index) {
                        Product product = cont.product.getAt(index);
                        return LineButtonWidget(
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
                        );
                      });
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
/*
GetBuilder<ProductController>(builder: (cont) {
              if (cont.product.length == 0) {
                return Center(
                    child: Text(
                  "Nincs termék",
                  style: TextStyle(color: color.subText, fontSize: 10.sp),
                ));
              } else {
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: cont.product.length,
                    itemBuilder: (context, index) {
                      Product product = cont.product.getAt(index);
                      return ButtonWidget(
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
                                  fontSize: 15.sp,
                                )),
                          ),
                        ),
                      );
                    });
              }
            })*/
