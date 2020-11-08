import 'package:football/domain/domain.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<int>>> fetchNews();
}