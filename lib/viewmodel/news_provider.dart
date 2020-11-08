import 'package:flutter/cupertino.dart';
import 'package:football/data/helper/ErrorData.dart';
import 'package:football/model/news.dart';
import 'base_viewmodel.dart';
import 'package:football/domain/domain.dart';

class NewsProvider extends BaseViewModel<News> {
  final NewsRepository newsRepository;


  NewsProvider({@required this.newsRepository});

  void fetchNews() async {
    setViewState(ViewState.loading);
    final result = await newsRepository.fetchNews();
    result.when(
        success: (data) {
          print("The first authour is ${data.length}");
    }, error: (error) {
          print("error is ${error.message}");
      setError(error);

    }, networkError: (message) {
          print("network error is $message");
      setError(ErrorData(message: message));
    });
    setViewState(ViewState.loaded);
  }
}
