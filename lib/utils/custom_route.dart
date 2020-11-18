import 'package:flutter/material.dart';


class Util {

  static Route slideUpRoute(Widget route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static void showSnackBar(BuildContext context, String message, Function function) {
    Future.delayed(Duration(milliseconds: 500), (){
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(days: 1),
        content: Text(message),
        action: SnackBarAction(
            label: "Retry",
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
              function();
            }),
      ));
    });
  }
}
