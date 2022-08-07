import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../global.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.background,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.tray_fill,
            size: 60.sp,
            color: color.subText,
          ),
          Text(
            "Nincs fűszer",
            style: TextStyle(color: color.subText, fontSize: 10.sp),
          )
        ],
      )),
    );
  }
}
