import 'package:flutter/cupertino.dart';

class Match {
  final int id;
  final String homeImageUrl;
  final String awayImageUrl;
  final String currentMinute;
  final bool isLive;
  final String league;
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String playTime;
  final String playDate;

  Match(
      {@required this.id,
      this.homeImageUrl,
      this.awayImageUrl,
      this.currentMinute,
      this.isLive = false,
      this.league,
      this.homeTeam,
      this.awayTeam,
      this.homeScore,
      this.awayScore,
      this.playTime,
      this.playDate});
}
