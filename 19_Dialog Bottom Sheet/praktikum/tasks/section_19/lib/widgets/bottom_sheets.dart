import 'package:flutter/material.dart';

class BottomSheets extends StatelessWidget {
  const BottomSheets({Key? key, required this.gambarBottom})
      : super(key: key);

  final String gambarBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height : 30),
        Text('Gambar Bottom Sheet', style : TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(gambarBottom),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}