
import 'package:football/data/data.dart';
import 'package:hive/hive.dart';

part 'league_table_local.g.dart';

@HiveType(typeId: 1)
class LeagueTableLocal {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? leagueName;
  @HiveField(2)
  int? position;
  @HiveField(3)
  int? teamId;
  @HiveField(4)
  String? teamName;
  @HiveField(5)
  String? teamLogo;
  @HiveField(6)
  int? playedGames;
  @HiveField(7)
  String? form;
  @HiveField(8)
  int? won;
  @HiveField(9)
  int? draw;
  @HiveField(10)
  int? lost;
  @HiveField(11)
  int? points;
  @HiveField(12)
  int? goalsFor;
  @HiveField(13)
  int? goalsAgainst;
  @HiveField(14)
  int? goalDifference;

  LeagueTableLocal(this.id, this.leagueName, this.position, this.teamId,
      this.teamName, this.teamLogo, this.playedGames, this.form, this.won,
      this.draw, this.lost, this.points, this.goalsFor, this.goalsAgainst,
      this.goalDifference);

  static List<LeagueTableLocal>? fromTable(TableResponse tableResponse) {
    final leagueId = tableResponse.competition?.id;
    final leagueName = tableResponse.competition?.name;
    final standings = tableResponse.standings;
    if (standings == null || standings.isEmpty) return null;
    final standing = standings[0];
    final table = standing.table;
    if (table != null && table.isNotEmpty) {
      return table.map((t) =>
           LeagueTableLocal(leagueId, leagueName, t.position, t.team?.id,
               t.team?.name, t.team?.crestUrl, t.playedGames, t.form,
               t.won, t.draw, t.lost, t.points, t.goalsFor,
               t.goalsAgainst, t.goalDifference)
      ).toList();
    } else {
      return null;
    }
  }
}
