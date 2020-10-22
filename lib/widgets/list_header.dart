import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String headerTitle;
  final String trailingTitle;
  final Function onTrailingTap;

  const ListHeader({Key key, @required this.headerTitle, this.onTrailingTap, this.trailingTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(headerTitle,
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 16.0)),
        trailingTitle != null ? InkWell(
          onTap: onTrailingTap,
          child: Text(trailingTitle.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey)),
        ): SizedBox.shrink()
      ],
    );
  }
}
