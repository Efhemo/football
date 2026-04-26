import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:football/widgets/round_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:football/model/match.dart';

class LiveMatchItem extends StatelessWidget {

  final Match match;

  const LiveMatchItem({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context)?.themeMode ?? ThemeMode.system;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
          color: themeMode == ThemeMode.light ? Colors.white : Palette.darkGrey,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 0.5)
            )
          ]
      ),
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RoundImage(imageUrl: match.homeImageUrl, isElevated: true),
                RoundImage(imageUrl: match.awayImageUrl),
                const Expanded(child: SizedBox.shrink()),
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const Icon(Icons.arrow_drop_down_circle, size: 12.0, color: Colors.red),
                        const SizedBox(width: 4),
                        const Text("Live", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Text("${match.currentMinute ?? "0"}'",
                        style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Text(match.league ?? "", style: const TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.bold)),
          ),
          _matchScore(match)
        ],
      ),
    );
  }

  Widget _matchScore(Match match) {
    var putPointerHome = false;
    var putPointerAway = false;

    final homeScore = match.homeScore ?? 0;
    final awayScore = match.awayScore ?? 0;

    if (homeScore > awayScore) {
      putPointerHome = true;
    } else if (homeScore < awayScore) {
      putPointerAway = true;
    }

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5.0, right: 20),
              child: Text(match.homeTeam ?? "", style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
            )),
            SizedBox(
              width: 35.0,
              child: Row(
                children: <Widget>[
                  Text(homeScore.toString(), style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  putPointerHome ? Icon(MdiIcons.menuLeft) : const SizedBox.shrink(),
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
              child: Text(match.awayTeam ?? "", maxLines: 2, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
            )),
            SizedBox(
              width: 35.0,
              child: Row(
                children: <Widget>[
                  Text(awayScore.toString(), style: const TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w500)),
                  putPointerAway ? Icon(MdiIcons.menuLeft) : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
