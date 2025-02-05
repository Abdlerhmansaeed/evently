import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/modules/Authentication/pages/create_account_screen.dart';
import 'package:evently/modules/Authentication/pages/forget_password_screen.dart';
import 'package:evently/modules/Authentication/pages/login_screen.dart';
import 'package:evently/modules/events/pages/create_event_screen.dart';
import 'package:evently/modules/events/pages/edit_event_screen.dart';
import 'package:evently/modules/events/pages/event_detaies_screen.dart';
import 'package:evently/modules/layout/pages/layout_screen.dart';
import 'package:evently/modules/onborading/pages/onborading_screen.dart';
import 'package:evently/modules/onborading/pages/welcome_page.dart';
import 'package:evently/modules/splash/pages/splash_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteName.splash: (_) => const SplashScreen(),
    AppRouteName.onborading: (_) => const OnboradingScreen(),
    AppRouteName.welcomePage: (_) => const WelcomePage(),
    AppRouteName.login: (_) => const LoginScreen(),
    AppRouteName.forgetPassword: (_) => const ForgetPasswordScreen(),
    AppRouteName.creatAccount: (_) => const CreateAccountScreen(),
    AppRouteName.layoutScreen: (_) => const LayoutScreen(),
    AppRouteName.createEventScreen: (_) => const CreateEventScreen(),
    AppRouteName.eventDetailesScreen: (_) => EventDetailsScreen(),
    AppRouteName.editEventScreen : (_) => const EditEventScreen(),
  };
}
