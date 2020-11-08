import 'package:football/data/hive/hive.dart';
import 'package:football/domain/model/articles_local.dart';
import 'package:hive/hive.dart';

class NewsLocalDataSourceImpl {
  final Box<ArticleLocal> articleBox = Hive.box(HiveSetup.Article);

  void saveArticle(ArticleLocal article) {
    Future.value([articleBox.add(article)]);
  }

  Future<List<int>> saveArticles(List<ArticleLocal> articles) async {
    final listOfKeys =  await articleBox.addAll(articles);
    return listOfKeys.toList();
  }

  Box<ArticleLocal> box() => articleBox;

  // Removes all entries from the box.
  Future<int> deleteAll() async {
    return await articleBox.clear();
  }
}