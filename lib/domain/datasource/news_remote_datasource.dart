import 'package:football/domain/result_wrapper.dart';
import 'package:football/domain/model/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<ResultWrapper<NewsResponse>> sport (String apiKey);
}