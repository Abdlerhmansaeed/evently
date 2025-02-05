import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/core/constant/app_assets.dart';

import 'package:flutter/material.dart';

class LanugageChangerWidget extends StatelessWidget {
  const LanugageChangerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AnimatedToggleSwitch<String>.rolling(
      current: "en",
      fittingMode: FittingMode.none,
      style: ToggleStyle(
          backgroundColor: Colors.transparent,
          indicatorColor: theme.primaryColor,
          borderColor: theme.primaryColor),
      values: ["en", "ar"],
      onChanged: (value) {},
      iconList: [
        Image.asset(AppAssets.arabicIcon),
        Image.asset(AppAssets.englishIcon),
      ],
    );
  }
}
