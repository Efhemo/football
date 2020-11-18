import 'package:dartz/dartz.dart';
import 'package:football/domain/domain.dart';

abstract class FootballRemoteDataSource {
  Future<Either<Failure, TableResponse>> table (int leagueId);
}