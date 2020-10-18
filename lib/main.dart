import 'package:flutter/material.dart';
import 'package:football/config/config.dart';
import 'package:football/config/theme.dart';
import 'package:football/profile_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screen.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeModeHandler(
      manager: AppTheme(),
      builder: (ThemeMode themeMode) {
        return MaterialApp(
          title: 'Football',
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: Styles.appBarTheme,
//            textTheme: Styles.textTheme
          ),
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            appBarTheme: Styles.appBarTheme,
//            textTheme: Styles.textTheme,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          themeMode: themeMode,
          home: ProfileScreen(),
        );
      },
    );
  }
}
