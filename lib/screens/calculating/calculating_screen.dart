import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:spice/widgets/input_field_widget.dart';
import 'package:spice/widgets/tab_screen_widget.dart';
import '../../controllers/language_controller.dart';
import '../../global.dart';

class CalculatingScreen extends StatelessWidget {
  CalculatingScreen({required this.tabIndex, required this.productController});
  ProductController productController;
  final int tabIndex;
  @override
  Widget build(BuildContext context) {
    if (productController.product.length == 0) {
      return GetBuilder<LanguageController>(
          init: language,
          builder: (controller) {
            return Scaffold(
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
              ),
              body: Container(
                color: color.background,
                child: Center(
                  child: Text(
                    controller.noProduct,
                    style: TextStyle(color: color.subText, fontSize: 10.sp),
                  ),
                ),
              ),
            );
          });
    } else {
      return DefaultTabController(
          length: productController.product.length,
          initialIndex: tabIndex,
          child: GetBuilder<LanguageController>(
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
                      preferredSize: Size.fromHeight(100.sp),
                      child: Column(
                        children: [
                          FadeInRight(
                            duration: Duration(milliseconds: 500),
                            child: TabBar(
                              tabs: List<Tab>.generate(
                                  productController.product.length,
                                  (index) => Tab(
                                        text: productController.product
                                            .getAt(index)
                                            .name,
                                      )),
                              isScrollable: true,
                              indicatorColor: Colors.transparent,
                              physics: BouncingScrollPhysics(),
                              labelStyle: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                              labelColor: color.mainText,
                              unselectedLabelStyle: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w600),
                              unselectedLabelColor: color.subText,
                              overlayColor:
                                  MaterialStateProperty.resolveWith((states) {
                                return Colors.transparent;
                              }),
                            ),
                          ),
                          FadeInUp(
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              height: 70.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.sp, vertical: 10.sp),
                                child: InputFieldWidget(
                                  initialValue:
                                      (quantity.quantity.toString() != "0.0")
                                          ? quantity.quantity.toString()
                                          : null,
                                  autofocus: true,
                                  labelText: controller.inputNumber,
                                  textInputType:
                                      TextInputType.numberWithOptions(),
                                  secondLabelText: "Kg",
                                  onChanged: (value) {
                                    print(value);
                                    if (double.tryParse(value) != null) {
                                      quantity.change(
                                          value: double.parse(value));
                                    } else {
                                      quantity.change(
                                          value: double.parse("0.0"));
                                    }
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  body: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              children: List<Widget>.generate(
                                  productController.product.length,
                                  (index) => TabScreenWidget(
                                      product: productController.product
                                          .getAt(index)))),
                        )
                      ],
                    ),
                  ),
                );
              }));
    }
  }
}
