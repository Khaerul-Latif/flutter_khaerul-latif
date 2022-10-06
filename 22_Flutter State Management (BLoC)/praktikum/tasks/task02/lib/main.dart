import 'package:task02/bloc/bloc1.dart';
import 'package:task02/bloc/bloc2.dart';
import 'package:task02/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClassBloc(),
        ),
        BlocProvider(
          create: (context) => Favorite(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: AppRoute.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
