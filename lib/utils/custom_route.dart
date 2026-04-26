import 'package:flutter/material.dart';


class Util {

  static Route slideUpRoute(Widget route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  static void showSnackBar(BuildContext context, String message, Function function) {
    Future.delayed(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(days: 1),
        content: Text(message),
        action: SnackBarAction(
            label: "Retry",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              function();
            }),
      ));
    });
  }
}
