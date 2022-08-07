import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:spice/widgets/button_widget.dart';
import '../global.dart';

class ProductsEditScreen extends StatelessWidget {
  const ProductsEditScreen({Key? key, required this.name}) : super(key: key);
  final name;
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.sp),
            child: IconButton(
              icon: Icon(
                Icons.delete,
                size: 20.sp,
                color: color.red,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25.sp),
          child: Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Termék szerkesztése",
                style: TextStyle(fontSize: 22.sp),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
          child: TextFormField(
            autofocus: true,
            initialValue: name,
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
                borderSide: BorderSide(color: color.inputBorder, width: 1.5.sp),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: color.inputBorder, width: 1.5.sp),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.check,
          color: color.mainText,
        ),
        backgroundColor: color.mainButton,
      ),
    );
  }
}
