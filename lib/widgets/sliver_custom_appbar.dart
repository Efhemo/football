import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class SliverCustomAppBar extends StatelessWidget {

  final String title;
  final Widget trailing;

  const SliverCustomAppBar({Key key, this.title, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context).themeMode;
    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconTheme: IconThemeData(),
      brightness: Palette.appBarTitleBrightness(themeMode),
      actions: <Widget>[trailing],
      expandedHeight: 100.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        centerTitle: false,
        title: Text(title, style: TextStyle(
            fontSize: 25.0,
            letterSpacing: -1,
            color: Palette.appBarTitleColor(themeMode),
            fontWeight: FontWeight.bold)),
      ),
    );
  }
}
