import 'package:football/data/model/articles_local.dart';

class News {
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishAt;

  News(this.id, this.author, this.title, this.description, this.url, this.urlToImage, this.publishAt);

  static News fromArticle(int key, ArticleLocal article){
    return News(key, article.author, article.title,
        article.description, article.url, article.urlToImage,
        article.publishedAt);
  }
}