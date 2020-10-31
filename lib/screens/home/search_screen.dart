import 'package:flutter/material.dart';
import 'package:football/widgets/widget.dart';

class SearchScreen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
              child: CustomSearchBar (
                canStartSearch: true,
                showCursor: true,
                readOnly: false,
              ),
            ),
            Divider(thickness: 1.0)
          ],
        ),
      ),
    );
  }
}
