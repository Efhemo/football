
import 'package:flutter/material.dart';
import 'package:football/config/palette.dart';
import 'package:football/model/news.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatefulWidget {

  final News news;
  NewsDetailsScreen(this.news);

  @override
  State<StatefulWidget> createState() {
    return NewsDetailsState();
  }
}

class NewsDetailsState extends State<NewsDetailsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.news.url ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context)!.themeMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news.author ?? widget.news.title ?? "",
          style: TextStyle(color: Palette.appBarTitleColor(themeMode)),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Palette.appBarTitleColor(themeMode)),
          onTap: () { Navigator.pop(context); },
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
