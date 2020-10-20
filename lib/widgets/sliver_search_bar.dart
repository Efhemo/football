import 'package:flutter/material.dart';
import 'package:football/config/config.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

class SliverSearchBar extends StatelessWidget {

  final Function onTapSearch;

  const SliverSearchBar({Key key, this.onTapSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode  = ThemeModeHandler.of(context).themeMode;
    return SliverToBoxAdapter(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 35.0,
          color: Palette.searchBarColor(themeMode),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Icon(Icons.search),
              Expanded(
                child: TextFormField(
                  onTap: onTapSearch,
                  showCursor: false,
                  readOnly: true,
                  decoration: InputDecoration(hintText: "Search", border: InputBorder.none),
                ),
              ),
              Icon(Icons.mic_none),
              SizedBox(width: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
