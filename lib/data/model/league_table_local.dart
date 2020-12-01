
import 'package:football/data/data.dart';
import 'package:hive/hive.dart';

part 'league_table_local.g.dart';

@HiveType()
class LeagueTableLocal {
  @HiveField(0)
  int id; //league id
  @HiveField(1)
  String leagueName;
  @HiveField(2)
  int position;
  @HiveField(3)
  int teamId;
  @HiveField(4)
  String teamName;
  @HiveField(5)
  String teamLogo;
  @HiveField(6)
  int playedGames;
  @HiveField(7)
  String form;
  @HiveField(8)
  int won;
  @HiveField(9)
  int draw;
  @HiveField(10)
  int lost;
  @HiveField(11)
  int points;
  @HiveField(12)
  int goalsFor;
  @HiveField(13)
  int goalsAgainst;
  @HiveField(14)
  int goalDifference;

  LeagueTableLocal(this.id, this.leagueName, this.position, this.teamId,
      this.teamName, this.teamLogo, this.playedGames, this.form, this.won,
      this.draw, this.lost, this.points, this.goalsFor, this.goalsAgainst,
      this.goalDifference);

  static List<LeagueTableLocal> fromTable(TableResponse tableResponse) {
    final leagueId = tableResponse.competition.id;
    final leagueName = tableResponse.competition.name;
    final standing  = tableResponse.standings[0];
    if(standing != null && standing.table.isNotEmpty){
      return standing.table.map((table) =>
           LeagueTableLocal(leagueId, leagueName, table.position, table.team.id,
               table.team.name, table.team.crestUrl, table.playedGames, table.form,
               table.won, table.draw, table.lost, table.points, table.goalsFor,
               table.goalsAgainst, table.goalDifference)
    ).toList();

    } else return null;

  }
}