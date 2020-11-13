import 'package:football/domain/domain.dart';
import 'package:football/model/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<int>>> fetchNews();

  Stream<List<News>> watchNews();
}