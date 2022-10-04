import 'package:flutter/material.dart';

import '../../models/contact.dart';

class ItemContact extends StatelessWidget {
  final Contact contact;
  const ItemContact({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          leading: Icon(
            Icons.account_circle_rounded,
            size: 40,
          ),
          title: Text(contact.name),
          subtitle: Text(contact.noTelp),
          trailing: Icon(Icons.delete)),
    );
  }
}
