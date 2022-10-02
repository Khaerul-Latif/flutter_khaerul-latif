import 'dart:math';
import 'package:flutter/material.dart';
import 'package:section_20/screens/form_class.dart';
import 'package:section_20/models/contacts_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Contacts",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/form-class').then(
                      (value) => setState(() {}),
                    );
              },
              icon: const Icon(
                Icons.add_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Apakah Yakin Ingin Dihapus?"),
                    content: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("Yes"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("No"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: ListTile(
              title: Text(items[index].name,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              subtitle: Text(items[index].phone,
                  style: const TextStyle(color: Colors.black)),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
                child: Center(
                  child: Text(
                    items[index].name[0],
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}