import 'package:football/data/datasource/footbal/football_local_data_source.dart';
import 'package:football/data/datasource/footbal/football_remote_datasource.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/model/league_table_local.dart';
import 'package:football/model/table_item.dart';
import 'package:football/model/team.dart';

class FootballRepositoryImp implements FootballRepository {
  final FootballRemoteDataSource footballRemoteDataSource;
  final FootballLocalDataSourceImpl footballLocalDataSourceImpl;

  FootballRepositoryImp(this.footballRemoteDataSource, this.footballLocalDataSourceImpl);

  @override
  Future<Either<Failure, int>> fetchTable(int leagueId) async {

    Either<Failure, int> saveResult;

    final apiResult = await footballRemoteDataSource.table(leagueId);

    if (apiResult.isRight()) {
      final response = apiResult.getOrElse(() => null);
      if (response != null) {
        await footballLocalDataSourceImpl.saveTeams(LeagueTableLocal.fromTable(response));
        saveResult = Right(1);
      } else
        saveResult = left(Failure(message: "Empty table"));
    } else
      saveResult = apiResult.flatMap((a) => null);

    return saveResult;
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