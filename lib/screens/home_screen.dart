import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football/data/data.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:football/config/config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context).themeMode;
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              iconTheme: IconThemeData(),
              brightness: Palette.appBarTitleBrightness(themeMode),
              actions: <Widget>[
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/profileScreen"),
                  child: Hero(
                    tag: "profile-avatar",
                    child: Container(
                      margin: const EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: CachedNetworkImageProvider(user.avatar),)
                    ),
                  ),
                ),
              ],
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                centerTitle: false,
                title: Text("Football", style: TextStyle(
                  fontSize: 25.0,
                    letterSpacing: -1,
                    color: Palette.appBarTitleColor(themeMode),
                    fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
