import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:football/model/match.dart';

class MatchItem extends StatelessWidget {

  final Match match;

  const MatchItem({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 0.5))
          ]),
      height: 100.0,
      width: 200.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _matchScore(match),
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: Row(
              children: <Widget>[
                const VerticalDivider(thickness: 1.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(match.playTime ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                    const SizedBox(height: 12.0),
                    Text(match.playDate ?? "", style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14.0))
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

    if (match.homeScore != null && match.awayScore != null) {
      if (match.homeScore! > match.awayScore!) {
        putPointerHome = true;
      } else if (match.homeScore! < match.awayScore!) {
        putPointerAway = true;
      }
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    SvgPicture.network(match.homeImageUrl ?? "", width: 16.0, height: 16.0),
                    const SizedBox(width: 8.0),
                    Expanded(child: Text(match.homeTeam ?? "", style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
              SizedBox(
                width: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    match.homeScore != null ? Text(match.homeScore.toString(), style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis) : const SizedBox.shrink(),
                    putPointerHome ? Icon(MdiIcons.menuLeft) : const SizedBox.shrink()
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    SvgPicture.network(match.awayImageUrl ?? "", width: 16.0, height: 16.0),
                    const SizedBox(width: 8.0),
                    Expanded(child: Text(match.awayTeam ?? "", style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
              SizedBox(
                width: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    match.awayScore != null ? Text(match.awayScore.toString(), style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis) : const SizedBox.shrink(),
                    putPointerAway ? Icon(MdiIcons.menuLeft) : const SizedBox.shrink()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
