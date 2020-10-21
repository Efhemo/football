import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String headerTitle;
  final String trailingTitle;

  const ListHeader({Key key, this.headerTitle, this.trailingTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(headerTitle,
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 16.0)),
        InkWell(
          onTap: () {},
          child: Text(trailingTitle.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey)),
        )
      ],
    );
  }
}
