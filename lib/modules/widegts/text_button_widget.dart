import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextButtonWidget extends StatelessWidget {
  String text;
  void Function()? onPressed;
  TextButtonWidget({super.key, required this.text , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: theme.primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
