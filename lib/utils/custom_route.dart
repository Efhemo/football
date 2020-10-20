import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  final Widget destination;
  CustomRoute({@required this.destination}) : super(builder: (BuildContext context) => destination);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: destination);
  }
}