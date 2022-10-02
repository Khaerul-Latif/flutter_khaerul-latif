import 'package:flutter/material.dart';
import 'package:section_20/screens/form_class.dart';

import 'screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': ((context) => const Home()),
        '/form-class': ((context) => const FormClass())
      },
      home: const Home(),
    ),
  );
}