import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class GetDialogWidget extends StatelessWidget {
  GetDialogWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonTitle,
      this.buttonTitle2,
      required this.buttonOnPressed,
      this.buttonOnPressed2})
      : super(key: key);
  String title;
  String description;
  String buttonTitle;
  String? buttonTitle2;
  Function() buttonOnPressed;
  Function()? buttonOnPressed2;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(
        description,
        style: TextStyle(color: color.secondText),
      ),
      actions: [
        if (buttonTitle2 != null)
          CupertinoDialogAction(
            child: Text(buttonTitle2!),
            onPressed: buttonOnPressed2,
          ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(buttonTitle),
          onPressed: buttonOnPressed,
        ),
      ],
    );
  }
}
