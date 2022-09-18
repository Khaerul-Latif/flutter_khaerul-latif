import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListView2(),
    );
  }
}

class ListView2 extends StatelessWidget {
  ListView2({Key? key}) : super(key: key);
  final List nama = [
    "Leanne Graham",
    "Ervin Howell",
    "Clementine Bauch",
    "Patricia Lebsack",
    "Chelsey Dietrich",
    "Mrs. Dennis Schulist",
    "Kurtis Weissnat"
  ];

  final List phoneNumber = [
    "1-770-736-8031 x56442",
    "010-692-6593 x09125",
    "1-463-123-4447",
    "493-170-9623 x156",
    "(254)954-1289",
    "1-477-935-8478 x6430",
    "210.067.6132"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON ListView in Flutter"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(nama[index], style: const TextStyle(fontSize: 23)),
              subtitle: Text(phoneNumber[index]),
              leading: CircleAvatar(
                child:
                    Text(nama[index][0], style: const TextStyle(fontSize: 20)),
                backgroundColor: Colors.green,
              ),
            ),
          );
        },
        itemCount: nama.length,
      ),
    );
  }
}
