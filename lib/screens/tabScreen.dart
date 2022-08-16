import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/controllers/quantity_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/models/spice.dart';
import 'package:spice/widgets/button_widget.dart';
import '../global.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color.background,
        child: GetBuilder<QuantityController>(builder: (controller) {
          print("változott a szorzó-------->${quantity.quantity.toString()}");

          /*if (controller.quantity == null || product.spices.length == 0) {
            return Text("nincs");
          } else {
            return Text(
                "${product.spices[0].name}: ${quantity.quantity * product.spices[0].quantity}");
          }*/

          return Column(
            children: [
              Expanded(
                child: GetBuilder<QuantityController>(builder: (controller) {
                  if (controller.quantity == null ||
                      product.spices.length == 0) {
                    return Center(
                        child: Text(
                      "Nincs fűszer",
                      style:
                          TextStyle(color: color.inputBorder, fontSize: 10.sp),
                    ));
                  } else {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: product.spices.length,
                        itemBuilder: (context, index) {
                          Spice spice = product.spices[index];
                          return ButtonWidget(
                            function: () {},
                            trailing: Padding(
                                padding: EdgeInsets.only(right: 10.sp),
                                child: Text(
                                  "${(controller.quantity * spice.quantity).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: color.secondText,
                                    fontSize: 15.sp,
                                  ),
                                )),
                            title: SizedBox(
                              height: 25.sp,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(spice.name,
                                    style: TextStyle(
                                      color: color.secondText,
                                      fontSize: 15.sp,
                                    )),
                              ),
                            ),
                          );
                        });
                  }
                }),
              ),
            ],
          );
        }));
  }
}
