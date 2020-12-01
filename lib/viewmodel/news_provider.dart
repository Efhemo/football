import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:football/model/news.dart';
import 'base_viewmodel.dart';
import 'package:football/domain/domain.dart';

class NewsProvider extends BaseViewModel<News> {
  final NewsRepository newsRepository;

  StreamController<List<News>> _streamController = StreamController();
  Stream<List<News>> get newsStream => _streamController.stream;

  NewsProvider({@required this.newsRepository}){
    fetchNews();

    //watchNews();
  }

  //not working
  void watchNews() {
    var listNews = List<News>();

    newsRepository.watchNews().listen((news) {
      listNews.add(news);
      print("news title is ${news.title}");
    }, onDone: () { // Not excecuting
      _streamController.sink.add(listNews);
      print("onDone is ${listNews.length}");
      listNews = List<News>();
    }, onError: (error) {
      print("on error is ${error}");
    });
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

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
