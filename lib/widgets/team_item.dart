import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:football/widgets/round_image.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class TeamItem extends StatelessWidget {

  final String title;
  final String imageUrl;
  final String subtitle;
  final int id;
  final String trailing;
  final Function() onTap;

  const TeamItem({Key key, @required this.title, @required this.imageUrl, this.subtitle, @required this.id, this.trailing, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context).themeMode;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 10, top: 3, bottom: 3, right: 23.0),
          leading: RoundImage(imageUrl: imageUrl),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0)),
          subtitle: Text(subtitle, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
            decoration: BoxDecoration(
                color: Palette.faintBlue(themeMode),
                borderRadius: BorderRadius.circular(5.0)
            ),
            child:  Text(trailing, style: TextStyle(fontWeight: FontWeight.bold)),
          )
        )
      ),
    );
  }
}
