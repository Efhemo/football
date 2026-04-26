import 'dart:async';

import 'package:football/model/news.dart';
import 'base_viewmodel.dart';
import 'package:football/domain/domain.dart';

class NewsProvider extends BaseViewModel<News> {
  final NewsRepository newsRepository;

  final StreamController<List<News>> _streamController = StreamController();
  Stream<List<News>> get newsStream => _streamController.stream;

  NewsProvider({required this.newsRepository}) {
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

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
