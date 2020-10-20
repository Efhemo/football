import 'package:flutter/material.dart';

class Palette {

  static Color appBarTitleColor(ThemeMode themeMode){
    return themeMode == ThemeMode.dark ? Colors.white : Colors.black;
  }
  static Brightness appBarTitleBrightness(ThemeMode themeMode){
    return themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }
}