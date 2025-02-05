import 'package:evently/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static TextTheme _textTheme(bool isDark) => TextTheme(
        bodyLarge: GoogleFonts.inter(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.lightBg : AppColors.black,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.lightBg : AppColors.black,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.lightBg : AppColors.black,
        ),
      );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBg,
    primaryColor: AppColors.primeyColor,
    primaryColorDark: AppColors.darkBg,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primeyColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360.r),
          side: BorderSide(color: Colors.white, width: 5.w)),
    ),
    primaryColorLight: Colors.white,
    textTheme: _textTheme(false),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primeyColor,
        iconTheme: const IconThemeData(color: AppColors.primeyColor),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: AppColors.primeyColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primeyColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.7),
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBg,
    primaryColor: AppColors.primeyColor,
    textTheme: _textTheme(true),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360.r),
          side: const BorderSide(color: Colors.white, width: 5)),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBg,
        iconTheme: IconThemeData(color: AppColors.primeyColor),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.primeyColor,
          fontSize: 20,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBg,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.7),
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
  );
}
