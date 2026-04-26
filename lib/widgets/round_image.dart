import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundImage extends StatelessWidget {
  final String? imageUrl;
  final bool isElevated;
  final bool isSelected;
  final VoidCallback? onTap;

  const RoundImage({Key? key, required this.imageUrl, this.isElevated = false, this.onTap, this.isSelected = false})
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
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 0.5)
              )
            ] : null,
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.network(
              imageUrl ?? "",
              width: 35.0,
            ),
          )),
    );
  }
}
