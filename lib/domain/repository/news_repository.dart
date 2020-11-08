import 'package:football/domain/domain.dart';

abstract class NewsRepository {
  Future<ResultWrapper<List<int>>> fetchNews();
}