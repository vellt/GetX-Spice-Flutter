import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../global.dart';

class SubTextWidget extends StatelessWidget {
  SubTextWidget(this.text, {Key? key}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 11.sp, color: color.subText),
      ),
    );
  }
}
