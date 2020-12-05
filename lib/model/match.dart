import 'package:flutter/cupertino.dart';
import 'package:football/data/model/games_local.dart';

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

  static Match fromGamesLocal(GamesLocal gamesLocal) {
    return Match(
        id: gamesLocal.id,
        homeImageUrl: gamesLocal.homeTeamLogo,
        awayImageUrl: gamesLocal.awayTeamLogo,
        currentMinute: "15",
        isLive: gamesLocal.status == "LIVE" ||
            gamesLocal.status == "IN_PLAY" ||
            gamesLocal.status == "PAUSED",
        league: gamesLocal.leagueName,
        homeTeam: gamesLocal.homeTeamName,
        awayTeam: gamesLocal.awayTeamName,
        homeScore: gamesLocal.scoreFullTimeHomeTeam ??
            gamesLocal.scoreHalfTimeHomeTeam,
        awayScore: gamesLocal.scoreFullTimeAwayTeam ??
            gamesLocal.scoreHalfTimeAwayTeam,
        playTime: "13:30", playDate: "18 JAN" );
  }
}
