import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:spice/controllers/language_controller.dart';
import 'package:spice/controllers/quantity_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/models/spice.dart';
import 'package:spice/widgets/line_button_widget.dart';
import '../global.dart';

class TabScreenWidget extends StatelessWidget {
  const TabScreenWidget({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.sp),
      child: GetBuilder<LanguageController>(builder: (controllerLanguage) {
        return GetBuilder<QuantityController>(builder: (controller) {
          print("változott a szorzó-------->${quantity.quantity.toString()}");
          if (controller.quantity == 0 || product.spices.length == 0) {
            return FadeInUp(
              duration: Duration(milliseconds: 500),
              child: Center(
                  child: Text(
                controllerLanguage.noSpice,
                style: TextStyle(color: color.subText, fontSize: 10.sp),
              )),
            );
          } else {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: product.spices.length,
                itemBuilder: (context, index) {
                  Spice spice = product.spices[index];
                  return FadeInUp(
                    duration: Duration(milliseconds: (index * 100 + 500)),
                    child: LineButtonWidget(
                      function: () {},
                      trailing: Padding(
                          padding: EdgeInsets.only(right: 10.sp),
                          child: Text(
                            "${(controller.quantity * (spice.quantity / product.quantity)).toStringAsFixed(2)}",
                            style: TextStyle(
                              color: color.secondText,
                              fontSize: 12.sp,
                            ),
                          )),
                      title: SizedBox(
                        height: 25.sp,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            spice.name,
                            style: TextStyle(
                              color: color.secondText,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      background: color.flatButton,
                    ),
                  );
                });
          }
        });
      }),
    );
  }
}
