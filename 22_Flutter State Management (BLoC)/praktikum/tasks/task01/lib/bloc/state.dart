part of 'bloc.dart';

abstract class ClassState {
  const ClassState();
}

class Contact extends ClassState {
  String name;
  String noTelp;

  Contact({this.name = '', this.noTelp = ''});

  List<Object> get props => [name, noTelp];

  @override
  String toString() => 'Contact(name : $name, noTelp: $noTelp)';
}

class ListContact extends ClassState {
  final List<Contact> listContact;

  ListContact({this.listContact = const []});

  List<Contact> get newListContact {
    if (listContact.isNotEmpty) {
      listContact.sort((a, b) => a.name.compareTo(b.name));
    }
    return List.unmodifiable(listContact);
  }

  List<Object> get props => [listContact];

  @override
  String toString() => 'List Contact : $listContact';
}
