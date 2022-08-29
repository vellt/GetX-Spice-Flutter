import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../global.dart';

class SecondTextWidget extends StatelessWidget {
  SecondTextWidget(this.text, {Key? key}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.5.sp),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: 13.sp, color: color.secondText),
        ),
      ),
    );
  }
}
