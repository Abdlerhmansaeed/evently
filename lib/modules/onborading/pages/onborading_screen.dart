import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/core/app_theme/app_colors.dart';
import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/modules/onborading/data_model/onboradingdata.dart';
import 'package:evently/modules/widegts/Custom_button_widget.dart';
import 'package:evently/modules/widegts/lanugage_changer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnboradingScreen extends StatelessWidget {
  const OnboradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.onboradingLogo,
                  width: 160.w,
                ),
              ),
              Expanded(child: Image.asset(AppAssets.onborading1)),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Text(
                  OnBoradingdata.onboradingdata[0].title,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.primaryColor),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Text(
                  OnBoradingdata.onboradingdata[0].discreption,
                  style: theme.textTheme.bodySmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Theme Mode",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.primaryColor),
                    ),
                    AnimatedToggleSwitch<ThemeMode>.rolling(
                      current: provider.themeMode,
                      values: [ThemeMode.light, ThemeMode.dark],
                      style: ToggleStyle(
                          backgroundColor: Colors.transparent,
                          indicatorColor: theme.primaryColor,
                          borderColor: theme.primaryColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      onChanged: (value) {
                        provider.changeTheme(value);
                      },
                      iconList: [
                        Image.asset(
                          AppAssets.sunIcon,
                        ),
                        Image.asset(
                          AppAssets.moonIcon,
                          color: provider.themeMode == ThemeMode.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Language",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.primaryColor),
                    ),
                    const LanugageChangerWidget()
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r, horizontal: 4.r),
                child: CustomButtonWidget(
                  title: "Let's Start",
                  backgroundColor: theme.primaryColor,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.lightBg,
                  ),
                  onPressed: () {
                    provider.setFirstTime();
                    provider.saveTheme();
                    Navigator.pushReplacementNamed(
                        context, AppRouteName.welcomePage);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
