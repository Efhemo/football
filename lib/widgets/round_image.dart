import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundImage extends StatelessWidget {
  final String imageUrl;
  final bool isElevated;

  const RoundImage({Key key, @required this.imageUrl, this.isElevated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: SvgPicture.network(
            imageUrl,
            width: 35.0,
          ),
        ));
  }
}
