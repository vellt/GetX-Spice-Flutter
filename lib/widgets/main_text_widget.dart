import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../global.dart';

class MainTextWidget extends StatelessWidget {
  MainTextWidget(this.text, {Key? key}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20.sp, color: color.mainText, fontWeight: FontWeight.w600),
    );
  }
}
