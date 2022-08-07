import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../global.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    required this.function,
  }) : super(key: key);
  final leading;
  final title;
  final subtitle;
  final trailing;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 12.sp),
      child: ElevatedButton(
        onPressed: function,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
          child: Row(
            children: [
              if (leading != null) leading,
              if (leading != null) SizedBox(width: 15.sp),
              if (title != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) title,
                    if (subtitle != null) SizedBox(height: 5.sp),
                    if (subtitle != null) subtitle
                  ],
                ),
              if (trailing != null)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: trailing,
                  ),
                ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: color.mainButton, shadowColor: Colors.transparent),
      ),
    );
  }
}
