import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './task02.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State {
  var jam = '';
  void startJam() {
    Timer.periodic(new Duration(seconds: 2), (_) {
      var tgl = new DateTime.now();
      var formatedjam = new DateFormat.Hms().format(tgl);
      setState(() {
        jam = formatedjam;
      });
    });
  }

  @override
  void initState() {
    startJam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: const Text('Flutter Widget')),
        body: Task02(jam: jam),
      ),
    );
  }
}
