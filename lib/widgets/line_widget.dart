import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../global.dart';

class LineWidget extends StatelessWidget {
  LineWidget({Key? key, this.text}) : super(key: key);
  String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null)
      return Divider(
        thickness: 1.sp,
        color: color.flatButton,
      );
    else
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Divider(
              thickness: 1.sp,
              color: color.line,
            ),
          ),
          SizedBox(width: 5.sp),
          Text(
            "vagy",
            style: TextStyle(fontSize: 11.sp, color: color.subText),
          ),
          SizedBox(width: 5.sp),
          Flexible(
            child: Divider(
              thickness: 1.sp,
              color: color.line,
            ),
          ),
        ],
      );
  }
}
