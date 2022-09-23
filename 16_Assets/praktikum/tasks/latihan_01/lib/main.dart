import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Latihan 01'),
        ),
        body: HomePage(),
      ),
    );
  }
}

Widget HomePage() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          "https://wallpapercave.com/wp/wp9392330.jpg",
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToXA4znlFUMBw1Ziu6JVUwWEWxukwGAtuKcw&usqp=CAU",
                height: 500,
                width: 500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
            child: Center(
              child: Text("Khaerul Latif",
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    ),
  );
}
