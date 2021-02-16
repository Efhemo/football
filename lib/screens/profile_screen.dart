import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:football/data/data.dart';
import 'package:football/widgets/sliver_custom_appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class ProfileScreen extends StatelessWidget {
  final _user = user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeMode = ThemeModeHandler.of(context).themeMode;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverCustomAppBar(
              flexibleTitle: "Profile",
              trailing: IconButton(
                  icon: Icon(Icons.track_changes), onPressed: () {})),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Container(
                  height: 120.0,
                  width: 120.0,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: themeMode == ThemeMode.dark
                          ? Colors.white
                          : Colors.black45,
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(_user.avatar),
                  ),
                ),
                SizedBox(height: 14.0),
                Text(_user.nickName,
                    style: textTheme.headline6
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 4.0),
                Text(_user.name,
                    style: textTheme.subtitle2
                        .copyWith(fontWeight: FontWeight.w400))
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(MdiIcons.moonWaningCrescent, size: 30.0),
                    title: Text("Dark mode",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Switch.adaptive(
                      value: _isDarkMode(context),
                      onChanged: (value) {
                        _setTheme(value, context);
                      },
                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.black,
                      activeTrackColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _setTheme(bool isDarkMode, BuildContext context) {
    var theme;
    if (isDarkMode) {
      theme = ThemeMode.dark;
    } else {
      theme = ThemeMode.light;
    }
    ThemeModeHandler.of(context).saveThemeMode(theme);
    Palette.setUpStatusBarThemeMode(theme);
    return isDarkMode;
  }

  bool _isDarkMode(BuildContext context) {
    var theme = ThemeModeHandler.of(context).themeMode;
    if (theme == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}
