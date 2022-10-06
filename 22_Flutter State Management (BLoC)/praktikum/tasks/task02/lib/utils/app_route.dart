import 'package:task02/utils/enter_exit_route.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future to(
    Widget exitPage,
    Widget route,
  ) {
    return navigator.push(EnterExitRoute(exitPage: exitPage, enterPage: route));
  }

  static void back<T extends Object?>([
    T? result,
  ]) {
    return navigator.pop(result);
  }
}
