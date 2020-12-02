import 'package:football/data/data.dart';
import 'package:football/data/model/games_response.dart';
import 'package:hive/hive.dart';

part 'games_local.g.dart';

@HiveType()
class GamesLocal {
  @HiveField(0)
  int leagueId;
  @HiveField(1)
  String leagueName;
  @HiveField(2)
  int id; //match id
  @HiveField(3)
  String utcDate;
  @HiveField(4)
  String status;
  @HiveField(5)
  int matchDay;
  @HiveField(6)
  String winner;
  @HiveField(7)
  String duration;
  @HiveField(8)
  int scoreFullTimeHomeTeam;
  @HiveField(9)
  int scoreFullTimeAwayTeam;
  @HiveField(10)
  int scoreHalfTimeHomeTeam;
  @HiveField(11)
  int scoreHalfTimeAwayTeam;
  @HiveField(12)
  int homeTeamId;
  @HiveField(13)
  String homeTeamName;
  @HiveField(14)
  String homeTeamLogo;
  @HiveField(15)
  int awayTeamId;
  @HiveField(16)
  String awayTeamName;
  @HiveField(17)
  String awayTeamLogo;

  GamesLocal(
      this.leagueId,
      this.leagueName,
      this.id,
      this.utcDate,
      this.status,
      this.matchDay,
      this.winner,
      this.duration,
      this.scoreFullTimeHomeTeam,
      this.scoreFullTimeAwayTeam,
      this.scoreHalfTimeHomeTeam,
      this.scoreHalfTimeAwayTeam,
      this.homeTeamId,
      this.homeTeamName,
      this.homeTeamLogo,
      this.awayTeamId,
      this.awayTeamName,
      this.awayTeamLogo);

  static GamesLocal fromMatches(Competition competition, Matches match,
      String homeTeamLogo, String awayTeamLogo){

    return GamesLocal(
        competition.id,
        competition.name,
        match.id, match.utcDate, match.status, match.matchday,
        match.score.winner,
        match.score.duration,
        match.score.fullTime.homeTeam, //scoreFullTimeHomeTeam
        match.score.fullTime.awayTeam,
        match.score.halfTime.homeTeam,
        match.score.halfTime.awayTeam,
        match.homeTeam.id, //homeTeamId,
        match.homeTeam.name,
        homeTeamLogo,
        match.awayTeam.id,
        match.awayTeam.name,
        awayTeamLogo);
  }
}