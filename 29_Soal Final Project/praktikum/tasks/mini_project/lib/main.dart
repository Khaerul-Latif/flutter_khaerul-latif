import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mini_project/providers/auth_provider.dart';
import 'package:mini_project/providers/user_provider.dart';
import 'package:mini_project/screens/home_screen.dart';
import 'package:mini_project/screens/login_screen.dart';
import 'package:mini_project/screens/splash_screen.dart';
import 'package:mini_project/shared/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
         ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo Tif',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home:LoginScreen(),
      ),
    );
  }
}