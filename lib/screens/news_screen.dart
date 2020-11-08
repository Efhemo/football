import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football/data/hive/hive.dart';
import 'package:football/domain/model/articles_local.dart';
import 'package:football/model/news.dart';
import 'package:football/viewmodel/base_viewmodel.dart';
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
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<NewsProvider>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ValueListenableBuilder<Box<ArticleLocal>>(
        valueListenable: Hive.box<ArticleLocal>(HiveSetup.Article).listenable() ,
        builder: (BuildContext context,  box, _){
          return Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverCustomAppBar(flexibleTitle: "News"),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final key = box.keyAt(index);
                        final article = box.getAt(index);
                        return NewsItem(news: News.fromArticle(key, article));
                      }, childCount: box.length))
                ],
              ),
              Consumer<NewsProvider>(
                  builder: (context, newsProvider, child){
                    return Visibility(
                      visible: newsProvider.state == ViewState.loading,
                      child: SpinKitSquareCircle(
                        color: Theme.of(context).accentColor,
                        size: 50.0,
                      ),
                    );
              })
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}
