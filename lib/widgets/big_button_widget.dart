import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../global.dart';

class BigButtonWidget extends StatelessWidget {
  BigButtonWidget({
    Key? key,
    required this.isDotted,
    required this.child,
    required this.background,
    required this.onPressed,
  }) : super(key: key);
  final bool isDotted;
  final Widget child;
  final Color background;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shadowColor: Colors.transparent.withOpacity(0.1),
          primary: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          padding: EdgeInsets.all(0.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          )),
      onPressed: onPressed,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(15.sp),
        dashPattern: [5.sp, 3.sp],
        color: (isDotted) ? color.bigButton : Colors.transparent,
        strokeWidth: 2,
        child: Container(
          decoration: (isDotted)
              ? null
              : BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
          height: (isDotted) ? 130.sp : 135.sp,
          width: (isDotted) ? 90.sp : 95.sp,
          child: child,
        ),
      ),
    );
  }
}
