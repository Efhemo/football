import 'package:football/data/hive/hive.dart';
import 'package:football/data/model/games_local.dart';
import 'package:football/data/model/league_table_local.dart';
import 'package:hive/hive.dart';

class FootballLocalDataSourceImpl {

  final Box<LeagueTableLocal> _leagueTableBox = Hive.box(HiveSetup.LeagueTeam);

  void saveTeam(int teamId, LeagueTableLocal team){
    Future.value([_leagueTableBox.put(teamId, team)]);
  }
  
  Future<void> saveTeams(List<LeagueTableLocal> _teams) async {
    final Map<int, LeagueTableLocal> teams = Map.fromIterable(_teams, key: (v) => v.teamId, value: (v) => v);
    return await _leagueTableBox.putAll(teams);
  }
  
  List<LeagueTableLocal> getLeagueTeam(int leagueId) =>
      _leagueTableBox.values.where((element) => element.id == leagueId).toList();

  List<LeagueTableLocal> topTeams() =>  _leagueTableBox.values.where((element) => element.position < 5).toList();

  String teamLogo(int teamId) {
    final leagueTable = _leagueTableBox.values.firstWhere((element) => element.teamId == teamId, orElse: null);
    return leagueTable != null ? leagueTable.teamLogo : "";
  }
}