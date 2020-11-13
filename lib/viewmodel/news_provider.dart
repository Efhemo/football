import 'package:flutter/cupertino.dart';
import 'package:football/model/news.dart';
import 'base_viewmodel.dart';
import 'package:football/domain/domain.dart';

class NewsProvider extends BaseViewModel<News> {
  final NewsRepository newsRepository;


  NewsProvider({@required this.newsRepository}){
    fetchNews();
  }

  void fetchNews() async {
    setViewState(ViewState.loading);
    final result = await newsRepository.fetchNews();
    result.fold(
            (l) => setError(l),
            (r) => setError(null)
    );
    setViewState(ViewState.loaded);
  }
}
