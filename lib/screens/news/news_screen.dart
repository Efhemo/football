import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football/data/hive/hive.dart';
import 'package:football/data/model/articles_local.dart';
import 'package:football/model/news.dart';
import 'package:football/viewmodel/provider.dart';
import 'package:football/widgets/widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<NewsProvider>(context, listen: false);
    });
  }

  void showSnackBar(String message) {
    Future.delayed(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(days: 1),
        content: Text(message),
        action: SnackBarAction(
            label: "Retry",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Provider.of<NewsProvider>(context, listen: false).fetchNews();
            }),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ValueListenableBuilder<Box<ArticleLocal>>(
        valueListenable: Hive.box<ArticleLocal>(HiveSetup.Article).listenable(),
        builder: (BuildContext context, box, _) {
          final article = box.values.toList();
          final keys = box.keys.toList();
          return Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  const SliverCustomAppBar(flexibleTitle: "News"),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final news = News.fromArticle(keys[index] as int, article[index]);
                    return NewsItem(
                        news: news,
                      onTap: () => Navigator.pushNamed(context, "/newsDetails", arguments: news),
                    );
                  }, childCount: keys.length))
                ],
              ),
              Consumer<NewsProvider>(builder: (context, newsProvider, child) {
                if (newsProvider.failure != null) {
                  showSnackBar(newsProvider.failure!.message);
                }
                return Visibility(
                  visible: newsProvider.state == ViewState.loading,
                  child: SpinKitSquareCircle(
                    color: Theme.of(context).colorScheme.secondary,
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
