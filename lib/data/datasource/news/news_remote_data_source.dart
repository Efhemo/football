import 'package:flutter/cupertino.dart';
import 'package:football/data/helper/network_helper.dart';
import 'package:football/data/retrofit/api_service.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/data.dart';


class NewsRemoteDataSourceImpl with NewsRemoteDataSource {
  final ApiService apiService;

  NewsRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<Either<Failure, NewsResponse>> sport(String apiKey) async {
    return await safeApiResult(apiService.news(apiKey: apiKey));
  }

}