import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundImage extends StatelessWidget {
  final String imageUrl;
  final bool isElevated;
  final bool isSelected;
  final Function onTap;

  const RoundImage({Key key, @required this.imageUrl, this.isElevated = false, this.onTap, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: isSelected ? Border.all(color: Colors.blueAccent, width: 1.5) : null,
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: isElevated ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0.5) // changes position of shadow
              )
            ]: null,
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: SvgPicture.network(
              imageUrl,
              width: 35.0,
            ),
          )),
    );
  }
}
