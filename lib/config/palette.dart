import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Palette {
  static Color backgroundColor = Color(0xFFF8F8F8);
  static Color backgroundColorDark = Color(0xFF1D1B1C);
  static Color darkGrey = Color(0xFF202020);
  static Color faintBlue(ThemeMode themeMode){
    return themeMode == ThemeMode.dark ? Colors.grey : Color(0xFFEAEDF3);
  }
  static Color lightWhite = Color(0xFFEAEAEB);

  static Color appBarTitleColor(ThemeMode themeMode) {
    return themeMode == ThemeMode.dark ? Colors.white : Colors.black;
  }
  static Brightness appBarTitleBrightness(ThemeMode themeMode){
    return themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }

  static void setUpStatusBarThemeMode(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: backgroundColorDark,
        //statusBarIconBrightness: Brightness.dark, // status bar icons' color
        //systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: backgroundColor,
      ));
    }
  }
}
