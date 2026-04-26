import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class SliverCustomAppBar extends StatelessWidget {

  final String? title;
  final String? flexibleTitle;
  final Widget? trailing;
  final IconData? iconLeading;
  final VoidCallback? onLeadingTap;

  const SliverCustomAppBar({Key? key, this.title, this.flexibleTitle, this.trailing, this.iconLeading, this.onLeadingTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context)?.themeMode ?? ThemeMode.system;
    return SliverAppBar(
      floating: true,
      pinned: title != null,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconTheme: const IconThemeData(),
      actions: trailing != null ? [trailing!] : null,
      centerTitle: false,
      expandedHeight: flexibleTitle != null ? 100.0 : 0.0,
      title: title != null ? Text(title!, style: TextStyle(fontWeight: FontWeight.bold, color: Palette.appBarTitleColor(themeMode)),) : const SizedBox.shrink(),
      leading: iconLeading != null ? InkWell(child: Icon(iconLeading, size: 20.0), onTap: onLeadingTap) : const SizedBox.shrink(),
      flexibleSpace: flexibleTitle != null ? FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        centerTitle: false,
        title: Text(flexibleTitle!, style: TextStyle(
            fontSize: 25.0,
            letterSpacing: -1,
            color: Palette.appBarTitleColor(themeMode),
            fontWeight: FontWeight.bold)),
      ) : const SizedBox.shrink(),
    );
  }
}
