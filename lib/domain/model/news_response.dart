import 'package:json_annotation/json_annotation.dart';
import 'articles_remote.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
