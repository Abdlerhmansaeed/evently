import 'package:evently/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class Loading {
  static bool isShown = false;

  static show(BuildContext context) {
    if (!isShown) {
      isShown = true;
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            title: Center(
              child: CircularProgressIndicator(
                color: AppColors.primeyColor,
              ),
            ),
          );
        },
      );
    }
  }

  static hide(BuildContext context) {
    if (isShown) {
      isShown = false;
      Navigator.pop(context);
    }
  }
}
