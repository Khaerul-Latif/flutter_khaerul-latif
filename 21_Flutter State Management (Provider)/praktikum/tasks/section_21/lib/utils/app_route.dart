import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';
import '../create_contact_screen/create_contact_screen.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static const String create = '/createContact';
  static const String home = '/';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (context) => const MyHomePage(),
    create: (context) => const CreateContactScreen(),
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
