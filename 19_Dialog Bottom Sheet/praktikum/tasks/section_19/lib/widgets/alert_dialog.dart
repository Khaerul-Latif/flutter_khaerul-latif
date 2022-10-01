import 'package:flutter/material.dart';
import 'package:section_19/models/data_model.dart';

class AlertDialogs extends StatelessWidget {
  const AlertDialogs({Key? key, required this.gambarAlert}) : super(key: key);

  final String gambarAlert;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Gambar Alert Dialog', style : TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      content: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
        height : 250,
        width : double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(gambarAlert),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
