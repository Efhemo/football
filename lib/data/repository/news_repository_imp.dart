import 'dart:async';

import 'package:football/data/datasource/datasource.dart';
import 'package:football/domain/domain.dart';
import 'package:football/data/model/articles_local.dart';
import 'package:football/model/news.dart';
import 'package:football/data/data.dart';

class NewsRepositoryImp implements NewsRepository {
  final NewsLocalDataSourceImpl newsLocalDataSourceImpl;
  final NewsRemoteDataSource newsRemoteRepository;
  final SecretLoader secretLoader;

  NewsRepositoryImp(this.newsLocalDataSourceImpl, this.newsRemoteRepository, this.secretLoader);

  @override
  Future<Either<Failure, List<int>>> fetchNews() async {
    final apiKey = await secretLoader.load();
    final apiResult = await newsRemoteRepository.sport(apiKey.newsApiKey);
    if (apiResult.isLeft()) {
      return Left(apiResult.fold((f) => f, (_) => Failure()));
    }
    final result = apiResult.getOrElse(() => throw Exception("unexpected"));
    final articles = result.articles;
    if (articles == null) return Left(Failure(message: "Empty news"));
    await newsLocalDataSourceImpl.deleteAll();
    final listOfKeys = await newsLocalDataSourceImpl.saveArticles(
        articles.map((e) => ArticleLocal.fromArticle(e)).toList());
    return Right(listOfKeys);
  }

  @override
  Stream<News> watchNews() =>
      newsLocalDataSourceImpl.watchArticle().map((event) => News.fromArticle(event.key as int, event.value));
}
