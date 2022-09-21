import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key, required this.gambarFull}) : super(key: key);

  final String gambarFull;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(gambarFull),
              fit: BoxFit.fitWidth
            ),
          ),
        ),
      ),
    );
  }
}