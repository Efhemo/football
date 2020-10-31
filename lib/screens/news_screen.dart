import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football/data/data.dart';
import 'package:football/widgets/widget.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverCustomAppBar(flexibleTitle: "News"),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return NewsItem(news: newsList[index]);
              }, childCount: newsList.length))
        ],
      ),
    );
  }
}
