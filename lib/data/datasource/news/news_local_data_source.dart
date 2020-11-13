import 'package:football/data/hive/hive.dart';
import 'package:football/domain/model/articles_local.dart';
import 'package:hive/hive.dart';

class NewsLocalDataSourceImpl {
  final Box<ArticleLocal> _articleBox = Hive.box(HiveSetup.Article);

  void saveArticle(ArticleLocal article) {
    Future.value([_articleBox.add(article)]);
  }

  Future<List<int>> saveArticles(List<ArticleLocal> articles) async {
    final listOfKeys =  await _articleBox.addAll(articles);
    return listOfKeys.toList();
  }

  Stream<BoxEvent> watchArticle() => _articleBox.watch();


  // Removes all entries from the box.
  Future<int> deleteAll() async {
    return await _articleBox.clear();
  }
}