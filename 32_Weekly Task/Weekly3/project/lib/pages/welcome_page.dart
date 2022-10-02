import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Image.network(
          "https://akcdn.detik.net.id/visual/2019/01/15/723621e9-4c3d-4c53-aad2-a9f232007392_169.jpeg?w=650",
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Stack(
            children: [
              SizedBox(height: 150),
              Text(
                'Dari Indonesia, Untuk Dunia',
                style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.black,
                ),
              ),
              Text(
                'Dari Indonesia, Untuk Dunia',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 100, left: 15),
          child: Text(
            'Toko yang menjual berbagai Perlengkapan Alat Olahraga Badminton',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 15),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Pelajari Lebih Lanjut",
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.white)),
          ),
        ),
      ],
    );
  }
}