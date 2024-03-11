import 'package:flutter/material.dart';

class DefaultPageRouteBuilder {
 
  static defaultRoute({
    required Widget screen,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }

  static animatedLeftRoute({
    required Widget screen,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      //this is like adjustion animation controller that is built in
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween<Offset>(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: tween.animate(animation), // animation.drive(tween),
          child: child,
        );
      },
    );
  }

   static animatedScaleRoute({
    required Widget screen,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      //this is like adjustion animation controller param
      reverseTransitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        /* var begin = 0.0;
        var end = 1.0; */
        var curve = Curves.easeInToLinear;
        //animation is defalut Animation<double> 0.0 TO 1.0
        animation = CurvedAnimation(parent: animation, curve: curve);
        /*  var tween = Tween<double>(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(curve: curve),
        ); */

        return ScaleTransition(
          scale: animation, // animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
