import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String nama;
  const NewPage({Key? key, required this.nama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(nama),
        ],
      ),
    );
  }
}
