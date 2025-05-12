import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/constant/app_assets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanugageChangerWidget extends StatelessWidget {
  const LanugageChangerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    return AnimatedToggleSwitch<String>.rolling(
      current: provider.appLocale,
      fittingMode: FittingMode.none,
      style: ToggleStyle(
          backgroundColor: Colors.transparent,
          indicatorColor: theme.primaryColor,
          borderColor: theme.primaryColor),
      values: ["en", "ar"],
      onChanged: (value) {
        provider.changeLocale(value);
      },
      iconList: [
        Image.asset(AppAssets.englishIcon),
        Image.asset(AppAssets.arabicIcon),
      ],
    );
  }
}
