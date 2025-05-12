import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  String appLocale = "en";
  void changeTheme(ThemeMode? value) {
    if (value != null) {
      themeMode = value;
    } else {
      if (themeMode == ThemeMode.light) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    }
    saveTheme();
    notifyListeners();
  }

  void changeLocale([String? value]) {
    if (value != null) {
      appLocale = value;
    } else {
      if (appLocale == "en") {
        appLocale = "ar";
      } else {
        appLocale = "en";
      }
    }
    saveLocale();
    notifyListeners();
  }

  Future<void> setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isFirstTime", false);
  }

  Future<bool> getFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isFirstTime") ?? true;
  }

  Future<void> saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", themeMode == ThemeMode.light ? "light" : "dark");
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString("theme") ?? "";
    themeMode = theme == "light" ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  Future<void> saveLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("lang", appLocale);
  }

  Future<void> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    appLocale = prefs.getString("lang") ?? "en";
  }
}
