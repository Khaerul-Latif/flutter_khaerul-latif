import 'package:flutter/material.dart';
import 'package:section_26/models/ContactModel.dart';

class ContactViewModel extends ChangeNotifier {
  final _listContact = [];

  List<ContactModel> get listContact {
    _listContact.sort((a, b) => a.name.compareTo(b.name));
    return List.unmodifiable(_listContact);
  }

  void addContact(ContactModel contact) {
    _listContact.add(contact);
    notifyListeners();
  }
}
