import 'package:flutter/material.dart';
import 'package:section_26/views/HomeScreen.dart';
import 'package:section_26/views/FormScreen.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static const String create = '/form-screen';
  static const String home = '/home-screen';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (context) => const HomeScreen(),
    create: (context) => const FormScreen(),
  };

  static Future<T?> to<T extends Object>(
    Widget route,
  ) {
    return navigator.push<T>(MaterialPageRoute(builder: (context) => route));
  }

  static Future<T?> withNameTo<T extends Object?>(
    String route, {
    Object? arguments,
  }) {
    return navigator.pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  static void back<T extends Object?>([
    T? result,
  ]) {
    return navigator.pop(result);
  }
}
