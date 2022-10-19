import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_26/utils/AppRoute.dart';
import 'package:section_26/viewmodels/ContactViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: AppRoute.navigatorKey,
        initialRoute: '/home-screen',
        routes: AppRoute.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
