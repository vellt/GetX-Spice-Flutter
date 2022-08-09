import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/product_controller.dart';
import 'package:spice/controllers/temp_spice_controller.dart';
import 'package:spice/models/product.dart';
import '../global.dart';

class SpiceAddScreen extends StatelessWidget {
  SpiceAddScreen({Key? key, required this.controller}) : super(key: key) {}
  TextEditingController spiceNameController = TextEditingController();
  TextEditingController spiceQuantityController = TextEditingController();
  final TempSpiceController controller;
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
            Get.back();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25.sp),
          child: Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Fűszer hozzáadása",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: spiceNameController,
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
                  labelStyle: TextStyle(color: color.inputBorder),
                  labelText: 'Megnevezés',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: color.inputBorder, width: 1.5.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: color.inputBorder, width: 1.5.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              TextFormField(
                controller: spiceQuantityController,
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
                  labelStyle: TextStyle(color: color.inputBorder),
                  labelText: 'Súly',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: color.inputBorder, width: 1.5.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: color.inputBorder,
                        width:
                            1.5.sp), //todo: mas legyen a szine mikor nem aktiv
                  ),
                  suffixIcon: Container(
                    height: 20.sp,
                    width: 40.sp,
                    child: Center(
                      child: Text(
                        "Kg",
                        style: TextStyle(
                            color: color.inputBorder, fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22.sp,
              ),
              Row(
                children: [
                  Text(
                    "összetevői",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  SizedBox(
                    height: 20.sp,
                    width: 45.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: color.mainButton,
                          shadowColor: Colors.transparent),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        size: 15.sp,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double quantity = double.parse(spiceQuantityController.text);
          controller.addSpice(
              name: spiceNameController.text,
              quantity: quantity,
              components: []);
          Get.back();
        },
        child: Icon(
          Icons.check,
          color: color.mainText,
        ),
        backgroundColor: color.mainButton,
      ),
    );
  }
}
