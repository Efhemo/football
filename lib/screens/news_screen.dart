import 'package:flutter/material.dart';
import 'package:football/data/hive/hive.dart';
import 'package:football/domain/model/articles_local.dart';
import 'package:football/model/news.dart';
import 'package:football/viewmodel/news_provider.dart';
import 'package:football/widgets/widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Provider.of<NewsProvider>(context).fetchNews();
    return Scaffold(
      body: ValueListenableBuilder<Box<ArticleLocal>>(
        valueListenable: Hive.box<ArticleLocal>(HiveSetup.Article).listenable() ,
        builder: (BuildContext context,  box, _){
          return CustomScrollView(
            slivers: <Widget>[
              SliverCustomAppBar(flexibleTitle: "News"),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final key = box.keyAt(index);
                    final article = box.getAt(index);
                    return NewsItem(news: News.fromArticle(key, article));
                  }, childCount: box.length))
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}
