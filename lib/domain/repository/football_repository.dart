import 'package:football/domain/domain.dart';
import 'package:football/model/team.dart';

abstract class FootballRepository {
  Future<Either<Failure, int>> fetchTable(int leagueId);

  List<Team> getLeagueTeam(int leagueId);
}