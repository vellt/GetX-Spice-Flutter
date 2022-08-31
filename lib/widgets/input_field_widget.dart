import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../global.dart';

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget({
    Key? key,
    this.controller,
    required this.labelText,
    this.secondLabelText,
    required this.autofocus,
    required this.textInputType,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);
  TextEditingController? controller;
  String labelText;
  String? secondLabelText;
  bool autofocus;
  TextInputType textInputType;
  String? initialValue;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      controller: controller,
      autofocus: autofocus,
      cursorColor: color.mainText,
      style: TextStyle(fontSize: 16.sp),
      textAlignVertical: TextAlignVertical.bottom,
      keyboardType: textInputType,
      validator: (value) {
        if (value!.isEmpty) {
          //if(textInputType== TextInputType.numberWithOptions())
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
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.subArrow, width: 1.5.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: color.subArrow,
              width: 1.5.sp), //todo: mas legyen a szine mikor nem aktiv
        ),
        suffixIcon: (secondLabelText == null)
            ? null
            : Container(
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
    );
  }
}
