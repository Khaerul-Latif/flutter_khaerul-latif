import 'package:flutter/material.dart';

class Task02 extends StatelessWidget {
  const Task02({
    super.key,
    required this.jam,
  });

  final String jam;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        jam,
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}