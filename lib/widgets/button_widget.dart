import 'package:flutter/cupertino.dart';
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
    this.hasPadding,
  }) : super(key: key);
  final leading;
  final title;
  final subtitle;
  final trailing;
  final void Function() function;
  final hasPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 5.sp, horizontal: (hasPadding == null) ? 12.sp : 0.sp),
      child: ElevatedButton(
        onPressed: function,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.sp),
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
            primary: color.mainButton, shadowColor: Colors.transparent),
      ),
    );
  }
}
