import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/config/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:football/model/match.dart';

class MatchItem extends StatelessWidget {

  final Match match;

  const MatchItem({Key key, this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).cardColor,
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
          _matchScore(match),
//          Expanded(child: SizedBox()),
          Container(
            margin: EdgeInsets.only(right: 12.0),
            child: Row(
              children: <Widget>[
                VerticalDivider(thickness: 1.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(match.playTime, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                    SizedBox(height: 12.0),
                    Text(match.playDate, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14.0))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _matchScore(Match match) {
    var putPointerHome = false;
    var putPointerAway = false;

    if(match.homeScore != null && match.awayScore != null){

      if (match.homeScore > match.awayScore) {
        putPointerHome = true;
        putPointerAway = false;
      }
      if (match.homeScore < match.awayScore) {
        putPointerHome = false;
        putPointerAway = true;
      }
    }

    return Expanded(
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
                      SvgPicture.network(match.homeImageUrl, width: 16.0, height: 16.0),
                      SizedBox(width: 8.0),
                      Expanded(child: Text(match.homeTeam, style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      match.homeScore != null ? Text(match.homeScore.toString(), style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis) : SizedBox.shrink(),
                      putPointerHome ? Icon(MdiIcons.menuLeft) : SizedBox.shrink()
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
                      SvgPicture.network(match.awayImageUrl, width: 16.0, height: 16.0),
                      SizedBox(width: 8.0),
                      Expanded(child: Text(match.awayTeam, style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      match.awayScore != null ? Text(match.awayScore.toString(), style: TextStyle( fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis) : SizedBox.shrink(),
                      putPointerAway ? Icon(MdiIcons.menuLeft) : SizedBox.shrink()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
