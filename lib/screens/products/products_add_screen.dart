import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/controllers/temp_spice_controller.dart';
import 'package:spice/models/product.dart';
import 'package:spice/models/spice.dart';
import 'package:spice/screens/spices/spice_add_screen.dart';
import 'package:spice/screens/spices/spice_edit_screen.dart';
import 'package:spice/widgets/line_button_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/main_text_widget.dart';
import 'package:spice/widgets/second_text_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../global.dart';

class ProductsAddScreen extends StatelessWidget {
  ProductsAddScreen({Key? key, required this.controller}) : super(key: key);
  TextEditingController productNameController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  TempSpiceController tempSpiceController = Get.put(TempSpiceController());
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
        padding: EdgeInsets.only(top: 3.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: productNameController,
                autofocus: true,
                cursorColor: color.mainText,
                style: TextStyle(fontSize: 16.sp),
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.text,
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
                      left: 15.sp, right: 10.sp, top: 18.sp, bottom: 12.sp),
                  labelStyle: TextStyle(color: color.subText),
                  labelText: 'Megnevezés',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: color.subArrow, width: 1.5.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: color.subArrow, width: 1.5.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              TextFormField(
                controller: productQuantityController,
                autofocus: true,
                cursorColor: color.mainText,
                style: TextStyle(fontSize: 16.sp),
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.numberWithOptions(),
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
                      left: 15.sp, right: 10.sp, top: 18.sp, bottom: 12.sp),
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
                        width:
                            1.5.sp), //todo: mas legyen a szine mikor nem aktiv
                  ),
                  suffixIcon: Container(
                    height: 20.sp,
                    width: 40.sp,
                    child: Center(
                      child: Text(
                        "Kg",
                        style: TextStyle(color: color.subText, fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.sp),
              LineWidget(),
              SizedBox(height: 5.sp),
              SecondTextWidget("Fűszerei"),
              SizedBox(height: 5.sp),
              SubTextWidget(
                  "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából"),
              SizedBox(height: 5.sp),
              LineButtonWidget(
                background: color.blue,
                function: () async {
                  //todo: átkéne adni a kövi page-nek 'tempSpiceController'
                  tempSpiceController = await Get.to(SpiceAddScreen(),
                      transition: Transition.cupertino);
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
                      "Fűszer hozzáadása",
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
              Expanded(
                child: GetBuilder<TempSpiceController>(builder: (cont) {
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
                                  spice.quantity.toString(),
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
        child: Icon(
          Icons.check,
          color: color.mainText,
        ),
        backgroundColor: color.blue,
      ),
    );
  }
}
