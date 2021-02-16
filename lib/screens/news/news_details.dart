
import 'package:flutter/cupertino.dart';
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

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ThemeModeHandler.of(context).themeMode;
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.news.author ?? widget.news.title, style: TextStyle(color: Palette.appBarTitleColor(themeMode))),
          leading: GestureDetector(child: Icon(Icons.arrow_back_ios, color: Palette.appBarTitleColor(themeMode)),
          onTap: () { Navigator.pop(context); },),
      ),
      body: WebView(
        initialUrl: widget.news.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}