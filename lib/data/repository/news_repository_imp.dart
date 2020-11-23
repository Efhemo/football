import 'dart:async';

import 'package:football/data/datasource/datasource.dart';
import 'package:football/data/datasource/news/news_local_data_source.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/model/articles_local.dart';
import 'package:football/model/news.dart';
import 'package:football/data/data.dart';

class NewsRepositoryImp with NewsRepository {
  final NewsLocalDataSourceImpl newsLocalDataSourceImpl;
  final NewsRemoteDataSource newsRemoteRepository;
  final SecretLoader secretLoader;

  NewsRepositoryImp(this.newsLocalDataSourceImpl, this.newsRemoteRepository, this.secretLoader);

  @override
  Future<Either<Failure, List<int>>> fetchNews() async {
    Either<Failure, List<int>> saveResult;

    final apiKey = await secretLoader.load();

    final apiResult = await newsRemoteRepository.sport(apiKey.newsApiKey);

    if (apiResult.isRight()) {
      final result = apiResult.getOrElse(() => null);
      if (result.articles != null) {
        await newsLocalDataSourceImpl.deleteAll();
        final listOfKeys = await newsLocalDataSourceImpl.saveArticles(
            result.articles.map((e) => ArticleLocal.fromArticle(e)).toList());
        saveResult = Right(listOfKeys);
      } else
        saveResult = left(Failure(message: "Empty news"));
    } else
      saveResult = apiResult.flatMap((a) => null);

    return saveResult;
  }

  @override
  Stream<News> watchNews() =>
      newsLocalDataSourceImpl.watchArticle().map((event) => News.fromArticle(event.key, event.value));
}
