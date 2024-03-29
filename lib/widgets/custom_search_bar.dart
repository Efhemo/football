import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function onTapSearch;
  final bool canStartSearch;
  final bool showCursor;
  final bool readOnly;

  const CustomSearchBar(
      {Key key,
      this.onTapSearch,
      this.canStartSearch = false,
      this.showCursor = false,
      this.readOnly = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 35.0,
              color: Theme.of(context).hoverColor,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Icon(Icons.search),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: TextFormField(
                      onTap: readOnly ? onTapSearch : null,
                      showCursor: showCursor,
                      readOnly: readOnly,
                      decoration: InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                  Icon(Icons.mic_none),
                  SizedBox(width: 8.0),
                ],
              ),
            ),
          ),
        ),
        canStartSearch
            ? FlatButton(
                child: Text(("Cancel")),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => Navigator.of(context).pop(),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
