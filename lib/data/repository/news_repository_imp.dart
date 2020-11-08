import 'dart:async';

import 'package:football/data/datasource/news_local_data_source.dart';
import 'package:football/domain/domain.dart';
import 'package:football/domain/model/articles_local.dart';

class NewsRepositoryImp with NewsRepository {
  final NewsLocalDataSourceImpl newsLocalDataSourceImpl;
  final NewsRemoteDataSource newsRemoteRepository;

  NewsRepositoryImp(this.newsLocalDataSourceImpl, this.newsRemoteRepository);

  @override
  Future<ResultWrapper<List<int>>> fetchNews() async {

    Completer<ResultWrapper<List<int>>> saveResult;
    final result = await newsRemoteRepository.sport("08e9d72144734304b9199e9536f4718a");
    result.when(success: (data) async {
      final result = data.articles;
      if( result != null){
        await newsLocalDataSourceImpl.deleteAll();
        final listOfKeys = await newsLocalDataSourceImpl.saveArticles(result.map((e) => ArticleLocal.fromArticle(e)).toList());
        saveResult.complete(ResultWrapper.success(data: listOfKeys));
      }else {
        saveResult.completeError(ResultWrapper.networkError(message: "Empty news"));
      }
    }, error: (error) {
      saveResult.completeError(ResultWrapper.error(error: error));
    }, networkError: (message) {
      saveResult.completeError(ResultWrapper.networkError(message: message));
    });

    return saveResult.future;
  }
  
  
}