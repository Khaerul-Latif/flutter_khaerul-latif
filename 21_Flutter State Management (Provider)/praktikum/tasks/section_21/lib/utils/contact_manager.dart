import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactManager extends ChangeNotifier {
  final _listContact = [];

  List<Contact> get listContact {
    _listContact.sort((a, b) => a.name.compareTo(b.name));
    return List.unmodifiable(_listContact);
  }

  void addContact(Contact contact) {
    _listContact.add(contact);
    notifyListeners();
  }
}
