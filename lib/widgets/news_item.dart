import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football/domain/domain.dart';
import 'package:football/model/news.dart';

class NewsItem extends StatelessWidget {
  final News news;
  final Function onTap;

  const NewsItem({Key key, @required this.news, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).cardColor,
        margin: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(news.urlToImage != null ? news.urlToImage : ""),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                    bottom: 0.0,
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      children: <Widget>[
                        Text(news.author ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                        SizedBox(height: 16.0),
                        Text(
                            news.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: news.description != null ? Text(
                news.description ?? "",
                style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ) : SizedBox.shrink(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 14.0
              ),
              child: Text(
                Utils.toAppDate(news.publishAt),
                style: TextStyle(
                  color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
