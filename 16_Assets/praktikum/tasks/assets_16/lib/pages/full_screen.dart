import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key, required this.gambarFull}) : super(key: key);
  final String gambarFull;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gambar Full'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(gambarFull), fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
