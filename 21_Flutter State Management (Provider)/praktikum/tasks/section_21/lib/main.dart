import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/app_route.dart';
import 'utils/contact_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactManager())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: AppRoute.navigatorKey,
        initialRoute: '/',
        routes: AppRoute.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
