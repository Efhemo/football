import 'package:football/domain/model/articles_remote.dart';
import 'package:hive/hive.dart';

part 'articles_local.g.dart';

@HiveType()
class ArticleLocal {
  @HiveField(0)
  String author;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String url;
  @HiveField(4)
  String urlToImage;
  @HiveField(5)
  String publishedAt;

  ArticleLocal(
        this.author,
        this.title,

        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt);

  static ArticleLocal fromArticle(Article article){
    return ArticleLocal(article.author, article.title,
        article.description, article.url, article.urlToImage,
        article.publishedAt);
  }
}