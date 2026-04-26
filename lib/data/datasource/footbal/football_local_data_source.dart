import 'package:football/data/hive/hive.dart';
import 'package:football/data/model/league_table_local.dart';
import 'package:hive/hive.dart';

class FootballLocalDataSourceImpl {

  final Box<LeagueTableLocal> _leagueTableBox = Hive.box(HiveSetup.LeagueTeam);

  void saveTeam(int teamId, LeagueTableLocal team) {
    Future.value([_leagueTableBox.put(teamId, team)]);
  }

  Future<void> saveTeams(List<LeagueTableLocal> teams) async {
    final Map<int, LeagueTableLocal> map = Map.fromIterable(
        teams,
        key: (v) => v.teamId ?? 0,
        value: (v) => v,
    );
    return await _leagueTableBox.putAll(map);
  }

  List<LeagueTableLocal> getLeagueTeam(int leagueId) =>
      _leagueTableBox.values.where((element) => element.id == leagueId).toList();

  List<LeagueTableLocal> topTeams() =>
      _leagueTableBox.values.where((element) => (element.position ?? 999) < 5).toList();

  String teamLogo(int teamId) {
    final results = _leagueTableBox.values.where((element) => element.teamId == teamId);
    return results.isNotEmpty ? (results.first.teamLogo ?? "") : "";
  }
}
