part of 'bloc1.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class AddContact extends Event {
  final Contact contact;

  const AddContact(this.contact);

  @override
  List<Object?> get props => [contact];

  @override
  String toString() => 'Added Contact -> $contact';
}

class RemoveContact extends Event {
  final Contact contact;

  const RemoveContact(this.contact);

  @override
  List<Object?> get props => [contact];

  @override
  String toString() => 'Remove Contact -> ${contact.name}';
}

class AddFavContact extends Event {
  final String name;

  const AddFavContact(this.name);

  @override
  List<Object?> get props => [name];

  @override
  String toString() => 'Added Favorite Contact -> $name';
}

class RemoveFavContact extends Event {
  final String name;

  const RemoveFavContact(this.name);

  @override
  List<Object?> get props => [name];

  @override
  String toString() => 'Remove Favorite Contact -> $name';
}
class LoadContact extends Event {
  final List<Contact> contact;
  const LoadContact({this.contact = const <Contact>[]});

  @override
  List<Object> get props => [contact];
}
