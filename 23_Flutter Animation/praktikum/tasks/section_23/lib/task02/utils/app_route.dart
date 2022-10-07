
import 'package:flutter/cupertino.dart';
import 'package:section_23/task02/utils/enter_exit_route.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future to(
    Widget exitPage,
    Widget nextPage,
  ) {
    return navigator.push(EnterExitRoute(exitPage: exitPage, enterPage: nextPage));
  }

  static void back<T extends Object?>([
    T? result,
  ]) {
    return navigator.pop(result);
  }
}
