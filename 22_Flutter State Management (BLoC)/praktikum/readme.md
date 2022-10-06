# (22) Flutter State Management (BLoC)
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
**Membuat membuat halaman create contact & home**
```dart
import 'package:section_22/utils/enter_exit_route.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future to(
    Widget exitPage,
    Widget route,
  ) {
    return navigator.push(EnterExitRoute(exitPage: exitPage, enterPage: route));
  }

  static void back<T extends Object?>([
    T? result,
  ]) {
    return navigator.pop(result);
  }
}
```

```dart
import 'package:flutter/material.dart';

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({required this.exitPage, required this.enterPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: exitPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterPage,
              )
            ],
          ),
        );
}

```
diatas membuat class route untuk perpindahan halaman dan untuk kembali ke halaman sebelumnya.

```dart
import 'package:flutter/material.dart';

class NameContactItem extends StatefulWidget {
  final Function(String)? name;
  const NameContactItem(this.name, {Key? key}) : super(key: key);

  @override
  State<NameContactItem> createState() => _NameContactItemState();
}

class _NameContactItemState extends State<NameContactItem> {
  final _controllerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerName,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        icon: const Icon(Icons.people),
        label: const Text('Name'),
        hintText: 'Name',
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        var name = value ?? '';
        if (name.isEmpty) {
          return 'Add Name Property';
        }
        return null;
      },
      onSaved: (value) {
        var name = value ?? '';
        var nameFunc = widget.name;
        if (name.isNotEmpty && nameFunc != null) {
          nameFunc(name);
        }
      },
    );
  }

  @override
  void dispose() {
    _controllerName.dispose();
    super.dispose();
  }
}

```
diatas membuat item nama 

```dart
import 'package:flutter/material.dart';

class NoTelpContactItem extends StatefulWidget {
  final Function(String)? noTelp;
  const NoTelpContactItem(this.noTelp, {Key? key}) : super(key: key);

  @override
  State<NoTelpContactItem> createState() => _NoTelpContactItemState();
}

class _NoTelpContactItemState extends State<NoTelpContactItem> {
  final _controllerTelp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controllerTelp,
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          icon: const Icon(Icons.phone),
          label: const Text('No.Telp'),
          hintText: '08xxxxxxx',
          border: const OutlineInputBorder(),),
      validator: (value) {
        var noTelp = value ?? '';
        if (noTelp.isEmpty) {
          return 'Add Phone Number Property';
        }
        return null;
      },
      onSaved: (value) {
        var noTelp = value ?? '';
        var noTelpFunc = widget.noTelp;
        if (noTelp.isNotEmpty && noTelpFunc != null) {
          noTelpFunc(noTelp);
        }
      },
    );
  }

  @override
  void dispose() {
    _controllerTelp.dispose();
    super.dispose();
  }
}
```
diatas membuat item no telepon

```dart
import 'package:section_22/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_route.dart';
import 'components/name_contact_item.dart';
import 'components/notelp_contact_item.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({Key? key}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var contact = Contact();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              NameContactItem((nama) => contact.name = nama),
              const SizedBox(
                height: 15,
              ),
              NoTelpContactItem((noTelp) => contact.noTelp = noTelp),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenSize.width,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        context.read<ClassBloc>().add(AddContact(contact));
                        AppRoute.back();
                      }
                    });
                  },
                  child: const Text('CREATE CONTACT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
diatas membuat halaman create yang berisi item nama dan item no telepon, serta beberapa package dan class yang di import

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';
import '../../utils/app_route.dart';

class Items extends StatefulWidget {
  final Contact contact;
  const Items({Key? key, required this.contact}) : super(key: key);

  @override
  State<Items> createState() => _ItemClassState();
}

class _ItemClassState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    var contact = widget.contact;
    return BlocBuilder<ClassBloc, ListContact>(
      builder: (context, state) {
        return BlocConsumer<ClassBloc, ListContact>(
          listener: (context, state) {},
          builder: (context, state) {
            var isFavorite = state.listContact.contains(contact.name);
            return Container(
              padding: const EdgeInsets.all(8),
              margin:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
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
                trailing: Icon(Icons.delete),
                subtitle: Text(contact.noTelp),
                onTap: () => _showDialogDelete(context, contact),
              ),
            );
          },
        );
      },
    );
  }

  void _showDialogDelete(BuildContext context, Contact contact) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Contact'),
          content: Text(
            'Delete contact "${contact.name}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => AppRoute.back(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => _deleteContact(context, contact),
              child: const Text('Yes'),
            ),
          ],
        ),
      );

  void _deleteContact(BuildContext context, Contact contact) {
    context.read<ClassBloc>().add(RemoveContact(contact));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text('Deleted Contact ${contact.name}'),
        duration: const Duration(seconds: 1),
      ),
    );
    AppRoute.back();
  }
}
```
membuat item yang menampung nama dan no telepon

```dart
import 'package:section_22/bloc/bloc.dart';
import 'package:section_22/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../create_contact_screen/create_contact_screen.dart';
import 'components/items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<ClassBloc>().add(LoadContact());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: BlocBuilder<ClassBloc, ListContact>(
        builder: (context, state) => Stack(
          children: [
            ListView.builder(
              itemCount: state.newListContact.length,
              itemBuilder: (context, index) {
                var contact = state.listContact[index];
                return Items(contact: contact);
              },
            ),
            state.newListContact.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group),
                        Text('Your contact is empty')
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            AppRoute.to(const MyHomePage(), const CreateContactScreen()),
        tooltip: 'New Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```
diatas untuk menampilkan halaman home yang di dalamnya berisi tampilan jika halaman home kosong, dan jika halaman home berisi item yang menampung nama dan no telepon
```dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'event.dart';
part 'state.dart';

class ClassBloc extends Bloc<Event, ListContact> {
  final List<Contact> _listItems = [];

  ClassBloc() : super(ListContact()) {
    on<AddContact>((event, emit) {
      _listItems.add(event.contact);
      emit(ListContact(listContact: _listItems));
    });
    on<RemoveContact>((event, emit) {
      _listItems.remove(event.contact);
      emit(ListContact(listContact: _listItems));
    });
    on<LoadContact>((event, emit) {
      emit(ListContact(listContact: _listItems));
    });
  }
}
```

```dart
part of 'bloc.dart';

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

class LoadContact extends Event {
  final List<Contact> contact;
  const LoadContact({this.contact = const <Contact>[]});

  @override
  List<Object> get props => [contact];
}
```

```dart
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

```
diatas membuat bloc yang menambahkan beberapa state dan event

### Task 02
**Membuat BLOC baru pada aplikasi contact list yang sudah dibuat sebelumnya**
```dart
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc1.dart';

class Favorite extends Bloc<Event, ListFavorite> {
  final List<String> _listFav = [];

  Favorite() : super(ListFavorite()) {
    on<AddFavContact>((event, emit) {
      _listFav.add(event.name);
      emit(ListFavorite(listFavorite: _listFav));
    });
    on<RemoveFavContact>((event, emit) {
      if (_listFav.contains(event.name)) {
        _listFav.remove(event.name);
        emit(ListFavorite(listFavorite: _listFav));
      }
    });
  }
}
```
diatas membuat bloc baru yang berisi beberapa state dan event

```dart
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
```
diatas menambahkan beberapa event

```dart
class ListFavorite extends ClassState {
  final List<String> listFavorite;

  ListFavorite({this.listFavorite = const []});

  List<Object> get props => [listFavorite];

  @override
  String toString() => 'List Favorite : $listFavorite';
}
```
diatas menambahkan beberapa event

# Hasil dari Task 01, Task 02, Latihan 01
## Hasil Task 01
![gif task01](/22_Flutter%20State%20Management%20(BLoC)/screenshots/gif1.gif)
![gif task01](/22_Flutter%20State%20Management%20(BLoC)/screenshots/gif2.gif)

## Hasil Task 02
![gif task02](/22_Flutter%20State%20Management%20(BLoC)/screenshots/gif4.gif)

## Hasil Latihan 01
![gif latihan 01](/22_Flutter%20State%20Management%20(BLoC)/screenshots/gif3.gif)