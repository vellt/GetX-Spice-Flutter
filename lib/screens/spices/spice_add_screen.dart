import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/spice_controller.dart';
import 'package:spice/widgets/input_field_widget.dart';
import 'package:spice/widgets/line_widget.dart';
import 'package:spice/widgets/sub_text_widget.dart';
import '../../global.dart';

class SpiceAddScreen extends StatelessWidget {
  SpiceAddScreen({Key? key, required this.controller}) : super(key: key) {}
  //text controllers
  TextEditingController spiceNameController = TextEditingController();
  TextEditingController spiceQuantityController = TextEditingController();
  //getxcontrololer
  SpiceController controller;
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
        padding: EdgeInsets.symmetric(horizontal: 14.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LineWidget(),
            SizedBox(height: 5.sp),
            SubTextWidget(
                "Régebbi állapot visszaállításához válaszd ki az adott mentést a listából"),
            SizedBox(height: 15.sp),
            InputFieldWidget(
              controller: spiceNameController,
              autofocus: true,
              labelText: "Megnevezés",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20.sp),
            InputFieldWidget(
              controller: spiceQuantityController,
              autofocus: false,
              labelText: "Súly",
              textInputType: TextInputType.numberWithOptions(),
              secondLabelText: "Kg",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double quantity = double.parse(spiceQuantityController.text);
          controller.addSpice(
            name: spiceNameController.text,
            quantity: quantity,
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
