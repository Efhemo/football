import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/config/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class MatchItem extends StatelessWidget {
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
                offset: Offset(0, 0.5)) // changes position of shadow
          ]),
      height: 100.0,
      width: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            SvgPicture.network("https://crests.football-data.org/61.svg", width: 16.0, height: 16.0),
                            SizedBox(width: 8.0),
                            Text("Chelsea", style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("3", style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                            Icon(MdiIcons.menuLeft)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            SvgPicture.network("https://crests.football-data.org/65.svg", width: 16.0, height: 16.0),
                            SizedBox(width: 8.0),
                            Text("Manchester city", style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      Container(
                        width: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Text("2", style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
//          Expanded(child: SizedBox()),
          Container(
            margin: EdgeInsets.only(right: 12.0),
            child: Row(
              children: <Widget>[
                VerticalDivider(thickness: 1.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("13:30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                    SizedBox(height: 12.0),
                    Text("18 JAN", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14.0))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
