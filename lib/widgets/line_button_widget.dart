import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LineButtonWidget extends StatelessWidget {
  const LineButtonWidget({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    required this.background,
    required this.function,
  }) : super(key: key);
  final leading;
  final title;
  final subtitle;
  final trailing;
  final Color background;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.sp,
      ),
      child: ElevatedButton(
        onPressed: function,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 9.5.sp),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (leading != null) leading,
              if (leading != null) SizedBox(width: 15.sp),
              if (title != null)
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (title != null) title,
                      if (subtitle != null) SizedBox(height: 5.sp),
                      if (subtitle != null) subtitle
                    ],
                  ),
                ),
              if (trailing != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: trailing,
                ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: background,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.sp), // <-- Radius
            )),
      ),
    );
  }
}
//ElevatedButton.styleFrom(
//            primary: color.flatButton, shadowColor: Colors.transparent)
