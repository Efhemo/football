import 'package:football/domain/repository/football_repository.dart';
import 'package:football/model/table_item.dart';
import 'package:football/model/team.dart';
import 'package:football/viewmodel/base_viewmodel.dart';

class FootballProvider extends BaseViewModel {

  final FootballRepository footballRepository;

  FootballProvider(this.footballRepository);

  List<Team> teams(int leagueId){
    return footballRepository.getLeagueTeam(leagueId);
  }

  List<TableItem> table(int leagueId){

    final result  = footballRepository.getLeagueTable(leagueId);
    result.sort((a, b) => a.position.compareTo(b.position));
    return result;
  }

  void fetchTable(int leagueId) async {
    await Future.delayed(Duration(milliseconds: 500));
    setViewState(ViewState.loading);
    final result = await footballRepository.fetchTable(leagueId);
    result.fold(
            (l) => setError(l),
            (r) => setError(null)
    );
    setViewState(ViewState.loaded);
  }



}