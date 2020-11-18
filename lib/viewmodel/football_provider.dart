import 'package:football/domain/repository/football_repository.dart';
import 'package:football/model/team.dart';
import 'package:football/viewmodel/base_viewmodel.dart';

class FootballProvider extends BaseViewModel {

  final FootballRepository footballRepository;

  FootballProvider(this.footballRepository);

  List<Team> teams(int leagueId){
    return footballRepository.getLeagueTeam(leagueId);
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