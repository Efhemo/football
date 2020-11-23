import 'package:dartz/dartz.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/data.dart';

abstract class NewsRemoteDataSource {
  Future<Either<Failure, NewsResponse>> sport (String apiKey);
}