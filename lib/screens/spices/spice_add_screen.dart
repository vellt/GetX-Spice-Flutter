import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/controllers/spice_controller.dart';
import 'package:spice/widgets/input_field_widget.dart';
import '../../controllers/language_controller.dart';
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
    return GetBuilder<LanguageController>(
        init: language,
        builder: (controllerLanguage) {
          return Scaffold(
            backgroundColor: color.background,
            appBar: AppBar(
              shadowColor: Colors.transparent.withOpacity(0.1),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: color.background,
              automaticallyImplyLeading: false,
              leading: IconButton(
                tooltip: controllerLanguage.otherBack,
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
                      controllerLanguage.spiceAddHeader1,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
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
                  SizedBox(height: 15.sp),
                  InputFieldWidget(
                    controller: spiceNameController,
                    autofocus: true,
                    labelText: controllerLanguage.inputText,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 20.sp),
                  InputFieldWidget(
                    controller: spiceQuantityController,
                    autofocus: false,
                    labelText: controllerLanguage.inputNumber,
                    textInputType: TextInputType.numberWithOptions(),
                    secondLabelText: "Kg",
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: controllerLanguage.spiceAddToolTip1,
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
                color: color.white,
              ),
              backgroundColor: color.blue,
            ),
          );
        });
  }
}
