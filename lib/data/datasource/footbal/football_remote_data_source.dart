import 'package:flutter/cupertino.dart';
import 'package:football/data/helper/network_helper.dart';
import 'package:football/data/retrofit/api_service.dart';
import 'package:football/domain/domain.dart';


class FootballRemoteDataSourceImpl with FootballRemoteDataSource {
  final ApiService apiService;

  FootballRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<Either<Failure, TableResponse>> table (int leagueId) async {
    return await safeApiResult(apiService.standings(leagueId));
  }

}