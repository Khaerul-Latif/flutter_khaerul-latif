import 'package:flutter/material.dart';

import 'form_screen.dart';

class Contact {
  String name;
  String number;

  Contact(this.name, this.number);
}

// ignore: camel_case_types
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Contact> contact = [
    Contact('Yanto', '098320132132'),
    Contact('Jamil', '0887321848342'),
    Contact('Aceng', '0883174892743'),
    Contact('Arwin', '083218431204'),
    Contact('Maul', '08391283012828'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Home Screen Contact"),
          ),
          floatingActionButton: SizedBox(
            height: 60,
            width: 60,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                      return const FormScreen();
                    }, transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                      final tween = Tween(begin: 0.0, end: 2.0);
                      return FadeTransition(
                          opacity: animation.drive(tween), child: child);
                    }),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final user = contact[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(user.name[0]),
                ),
                onTap: () {},
                title: Text(
                  user.name,
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  user.number,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
            itemCount: contact.length,
          ),
        ),
      ),
    );
  }
}
