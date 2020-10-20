import 'package:flutter/material.dart';

class Palette {

  static Color backgroundColor = Color(0xFFF8F8F8);
  static Color backgroundColorDark = Color(0xFF1D1B1C);
  static Color searchBarColor(ThemeMode themeMode){
    return themeMode == ThemeMode.dark ? Color(0xFF202020) : Color(0xFFEAEAEB);
  }

  static Color appBarTitleColor(ThemeMode themeMode){
    return themeMode == ThemeMode.dark ? Colors.white : Colors.black;
  }
  static Brightness appBarTitleBrightness(ThemeMode themeMode){
    return themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }
}