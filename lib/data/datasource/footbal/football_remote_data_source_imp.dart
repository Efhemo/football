import 'package:flutter/cupertino.dart';
import 'package:football/data/helper/network_helper.dart';
import 'package:football/data/model/games_response.dart';
import 'package:football/data/retrofit/api_service.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/data.dart';


class FootballRemoteDataSourceImpl with FootballRemoteDataSource {
  final ApiService apiService;

  FootballRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<Either<Failure, TableResponse>> table (int leagueId) async {
    return await safeApiResult(apiService.standings(leagueId));
  }

  @override
  Future<Either<Failure, GamesResponse>> games (int leagueId) async {
    final currentDate = DateTime.now();
    final yesterday  = currentDate.subtract(Duration(days: 1));
    final next8Days = currentDate.add(Duration(days: 8));

    return await safeApiResult(apiService.games(
        leagueId,
        Utils.dateFormat(yesterday),
        Utils.dateFormat(next8Days)
    ));
  }

}