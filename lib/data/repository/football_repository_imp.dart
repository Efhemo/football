import 'package:football/data/datasource/footbal/football_local_data_source.dart';
import 'package:football/data/datasource/footbal/football_remote_datasource.dart';
import 'package:football/data/model/games_local.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/model/league_table_local.dart';
import 'package:football/model/match.dart';
import 'package:football/model/table_item.dart';
import 'package:football/model/team.dart';

class FootballRepositoryImp implements FootballRepository {
  final FootballRemoteDataSource footballRemoteDataSource;
  final FootballLocalDataSourceImpl footballLocalDataSourceImpl;

  FootballRepositoryImp(this.footballRemoteDataSource, this.footballLocalDataSourceImpl);

  @override
  Future<Either<Failure, int>> fetchTable(int leagueId) async {
    final apiResult = await footballRemoteDataSource.table(leagueId);
    if (apiResult.isLeft()) {
      return Left(apiResult.fold((f) => f, (_) => Failure()));
    }
    final response = apiResult.getOrElse(() => throw Exception("unexpected"));
    final teams = LeagueTableLocal.fromTable(response);
    if (teams == null) return Left(Failure(message: "Empty table"));
    await footballLocalDataSourceImpl.saveTeams(teams);
    return Right(1);
  }

  @override
  Future<Either<Failure, List<Match>>> fetchGames(int leagueId) async {
    final apiResult = await footballRemoteDataSource.games(leagueId);
    if (apiResult.isLeft()) {
      return Left(apiResult.fold((f) => f, (_) => Failure()));
    }
    final response = apiResult.getOrElse(() => throw Exception("unexpected"));
    final matches = response.matches;
    if (matches == null) return Left(Failure(message: "Empty game"));
    final games = matches.map((element) {
      final homeTeamLogo = footballLocalDataSourceImpl.teamLogo(element.homeTeam?.id ?? 0);
      final awayTeamLogo = footballLocalDataSourceImpl.teamLogo(element.awayTeam?.id ?? 0);
      final local = GamesLocal.fromMatches(response.competition!, element, homeTeamLogo, awayTeamLogo);
      return Match.fromGamesLocal(local);
    }).toList();
    return Right(games);
  }

  @override
  List<Team> getLeagueTeam(int leagueId) {
    return footballLocalDataSourceImpl.getLeagueTeam(leagueId).map((e) =>
        Team.fromTeamLocal(e)).toList();
  }

  @override
  List<TableItem> getLeagueTable(int leagueId) {
    return footballLocalDataSourceImpl.getLeagueTeam(leagueId).map((e) =>
        TableItem.fromTeamLocal(e)).toList();
  }

  @override
  List<Team> topTeams() => footballLocalDataSourceImpl.topTeams().map((e) =>
      Team.fromTeamLocal(e)).toList();
}
