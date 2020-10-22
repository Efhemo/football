import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:football/widgets/round_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class LiveMatchItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context).themeMode;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
          color: themeMode == ThemeMode.light ? Colors.white : Palette.darkGrey,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0.5)
            )// changes position of shadow
          ]
      ),
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RoundImage(imageUrl: "https://crests.football-data.org/61.svg", isElevated: true),
                RoundImage(imageUrl: "https://crests.football-data.org/65.svg"),
                const Expanded(child: SizedBox.shrink()),
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const Icon(Icons.arrow_drop_down_circle, size: 12.0,color: Colors.red),
                        SizedBox(width: 4),
                        const Text("Live", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Text("15'",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0 ),
            child: Text("Premier League", style: TextStyle(color: Colors.grey,fontSize: 12.0, fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 5, bottom: 10.0, right: 20),
                child: Text("Manchester city", style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
              )),
              Container(
                width: 35.0,
                child: Row(
                  children: <Widget>[
                    Text("2", style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold)),
                    Icon(MdiIcons.menuLeft),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Text("Liverpool FC", maxLines: 2, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
              )),
              Container(width: 35.0, child: Text("2"),)
            ],
          ),
        ],
      ),
    );
  }
}
