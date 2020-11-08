import 'dart:async';

import 'package:football/data/datasource/news_local_data_source.dart';
import 'package:football/domain/domain.dart';
import 'package:football/domain/model/articles_local.dart';

class NewsRepositoryImp with NewsRepository {
  final NewsLocalDataSourceImpl newsLocalDataSourceImpl;
  final NewsRemoteDataSource newsRemoteRepository;

  NewsRepositoryImp(this.newsLocalDataSourceImpl, this.newsRemoteRepository);

  @override
  Future<Either<Failure, List<int>>> fetchNews() async {

    Either<Failure, List<int>> saveResult;
    final apiResult =  await newsRemoteRepository.sport("08e9d72144734304b9199e9536f4718a");
    
    if(apiResult.isRight()){
      final result = apiResult.getOrElse(() => null);
      if( result.articles != null){
        await newsLocalDataSourceImpl.deleteAll();
        final listOfKeys = await newsLocalDataSourceImpl.saveArticles(result.articles.map((e) => ArticleLocal.fromArticle(e)).toList());
        saveResult = Right(listOfKeys);
      }else saveResult = left(Failure(message: "Empty news"));
    } else saveResult =  apiResult.flatMap((a) => null);

    return saveResult;

  }
  
  
}