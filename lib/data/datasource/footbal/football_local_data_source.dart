import 'package:football/data/hive/hive.dart';
import 'package:football/domain/model/league_table_local.dart';
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

}