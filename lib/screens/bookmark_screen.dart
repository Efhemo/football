import 'package:flutter/material.dart';
import 'package:football/widgets/widget.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverCustomAppBar(flexibleTitle: "Bookmark"),
        ],
      ),
    );
  }
}
