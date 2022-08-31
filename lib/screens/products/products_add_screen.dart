import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/controllers/spice_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/models/spice.dart';
import 'package:spice/screens/spices/spice_add_screen.dart';
import 'package:spice/screens/spices/spice_edit_screen.dart';
import 'package:spice/widgets/input_field_widget.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/second_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../global.dart';

class ProductsAddScreen extends StatelessWidget {
  ProductsAddScreen({Key? key, required this.controller}) : super(key: key);
  //textEdit controlers
  TextEditingController productNameController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  //getx controllers
  SpiceController tempSpiceController = Get.put(SpiceController());
  final ProductController controller;

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
          onPressed: () {
            tempSpiceController.onClose();
            Get.back();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25.sp),
          child: Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MainTextWidget("Termékek hozzáadása"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputFieldWidget(
                controller: productNameController,
                autofocus: false,
                labelText: "Megnevezés",
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 20.sp),
              InputFieldWidget(
                controller: productQuantityController,
                autofocus: false,
                labelText: "Súly",
                textInputType: TextInputType.numberWithOptions(),
                secondLabelText: "Kg",
              ),
              SizedBox(height: 5.sp),
              LineWidget(),
              SizedBox(height: 5.sp),
              SecondTextWidget("Fűszerek"),
              SizedBox(height: 5.sp),
              SubTextWidget(
                  "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából"),
              SizedBox(height: 5.sp),
              LineButtonWidget(
                background: color.blue,
                function: () async {
                  //todo: átkéne adni a kövi page-nek 'tempSpiceController'
                  Get.to(SpiceAddScreen(controller: tempSpiceController),
                      transition: Transition.cupertino);
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
                      "Fűszer hozzáadása",
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
              Expanded(
                child: GetBuilder<SpiceController>(builder: (cont) {
                  if (cont.spices.length == 0) {
                    return Center(
                        child: Text(
                      "Nincs fűszer",
                      style: TextStyle(color: color.subText, fontSize: 10.sp),
                    ));
                  } else {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: cont.spices.length,
                        itemBuilder: (context, index) {
                          Spice spice = cont.spices[index];
                          return LineButtonWidget(
                            function: () async {
                              var result = await Get.to(
                                  SpiceEditScreen(
                                    spice: cont.spices[index],
                                    controller: tempSpiceController,
                                  ),
                                  transition: Transition.cupertino);
                              if (result != null) {
                                tempSpiceController.spices[index].name =
                                    result.name;
                                tempSpiceController.spices[index].quantity =
                                    result.quantity;
                              }
                            },
                            trailing: Padding(
                                padding: EdgeInsets.only(right: 10.sp),
                                child: Text(
                                  spice.quantity.toStringAsFixed(2),
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
                          );
                        });
                  }
                }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.createProduct(
            product: Product(
              name: productNameController.text,
              quantity: double.parse(productQuantityController.text), //a vessz
              spices: tempSpiceController.spices,
              isFavorite: false,
            ),
          );

          Get.back();
        },
        child: Icon(Icons.check, color: color.white),
        backgroundColor: color.blue,
      ),
    );
  }
}