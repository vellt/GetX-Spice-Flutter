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
          child: Text(
        "Nincs fűszer",
        style: TextStyle(color: color.subText, fontSize: 10.sp),
      )),
    );
  }
}
