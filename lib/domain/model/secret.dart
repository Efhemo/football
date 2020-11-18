
class Secret {
  final String newsApiKey;
  final String footballApiKey;

  Secret({this.newsApiKey, this.footballApiKey});

  factory Secret.fromJson(Map<String, dynamic> json) =>
      Secret(newsApiKey: json['news_api_key'], footballApiKey: json["football_api_key"]);
}