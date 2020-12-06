import 'package:dartz/dartz.dart';
import 'package:football/data/model/games_response.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/data.dart';

abstract class FootballRemoteDataSource {
  Future<Either<Failure, TableResponse>> table (int leagueId);
  Future<Either<Failure, GamesResponse>> games (int leagueId);
}