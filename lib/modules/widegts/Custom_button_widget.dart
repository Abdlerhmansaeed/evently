import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  String title;
  Color? backgroundColor;
  TextStyle? style;
  String? icon;
  void Function() onPressed;
  CustomButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
       this.backgroundColor,
       this.style,
      this.icon});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: theme.primaryColor),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (icon != null)
              Image.asset(
                icon!,
                width: 26.w,
                height: 26.h,
              ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(title, style: style),
            ),
          ]),
        ));
  }
}
