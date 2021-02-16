import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:football/screens/screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _destinations = [
    FootballScreen(),
    NewsScreen(),
    BookmarkScreen(),
    ProfileScreen()
  ];

  final _bottomNavItem = {
    "Football": MdiIcons.soccer,
    "News": Icons.chat_bubble_outline,
    "Bookmark": Icons.done_outline,
    "Profile": Icons.person_outline
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Palette.setUpStatusBarThemeMode(ThemeModeHandler.of(context).themeMode);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _destinations,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28.0,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: _bottomNavItem
            .map((title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(icon),
                  title: Text(title)
                )))
            .values
            .toList(),
      ),
    );
  }
}
