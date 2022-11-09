import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_project/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Color(0xffff1616),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
