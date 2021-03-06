import 'package:football/domain/domain.dart';
import 'package:football/model/match.dart';
import 'package:football/model/table_item.dart';
import 'package:football/model/team.dart';

abstract class FootballRepository {
  Future<Either<Failure, int>> fetchTable(int leagueId);

  Future<Either<Failure, List<Match>>> fetchGames(int leagueId);

  List<Team> getLeagueTeam(int leagueId);

  List<TableItem> getLeagueTable(int leagueId);

  List<Team> topTeams();
}