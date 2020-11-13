
class Secret {
  final String newsApiKey;

  Secret({this.newsApiKey});

  factory Secret.fromJson(Map<String, dynamic> json) =>
      Secret(newsApiKey: json['news_api_key']);
}