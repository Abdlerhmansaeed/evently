import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/constant/category_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatelessWidget {
  final CategoryData categoryData;
  bool isSelected;
  Color? fillColor;
  Color? borderColor;
  Color? textColor;
  TabWidget(
      {super.key,
      required this.categoryData,
      required this.isSelected,
      this.borderColor,
      this.textColor,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: fillColor != null && isSelected
              ? fillColor
              : isSelected
                  ? (appProvider.themeMode == ThemeMode.light
                      ? Colors.white
                      : theme.primaryColor)
                  : null,
          border: Border.all(
              color: borderColor ??
                  (appProvider.themeMode == ThemeMode.light
                      ? Colors.white
                      : theme.primaryColor)),
          borderRadius: BorderRadius.circular(46.r)),
      child: Text(
        categoryData.name,
        style: TextStyle(
          fontSize: 16.sp,
          color: textColor != null && isSelected
              ? textColor = Colors.white
              : isSelected
                  ? (appProvider.themeMode == ThemeMode.light
                      ? theme.primaryColor
                      : Colors.white)
                  : null,
        ),
      ),
    );
  }
}
