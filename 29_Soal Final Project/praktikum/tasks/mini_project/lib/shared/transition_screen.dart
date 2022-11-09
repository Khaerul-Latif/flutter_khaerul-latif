import 'package:flutter/material.dart';

PageRoute TransitionScreen({Widget? widget, Offset? offset}) {
  return PageRouteBuilder(
    pageBuilder: (
      context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        widget!,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (
      context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: offset,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
