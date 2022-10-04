# (21) Flutter State Management (Provider)

## Data diri
Nomor Peserta : 1_013FLB_50 <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
**Membuat halaman Home & halaman Create Contact, dengan detail**
1. Halaman Home akan menampilkan daftar kontak vang sudah didaftarkan dan sebuah tombol untuk navigasi ke halaman pembuatan kontak.

```dart
    Consumer<ContactManager>(
        builder: (context, manager, child) => Stack(
          children: [
            ListView.builder(
              itemCount: manager.listContact.length,
              itemBuilder: (context, index) {
                var contact = manager.listContact[index];
                return ItemContact(contact: contact);
              },
            ),
            manager.listContact.isEmpty
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
```

diatas proses menampilkan listview di halaman home, jika tidak ada list makan akan ada text dan icon

```dart
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRoute.to(CreateContactScreen(
            manager: manager,
          ));
        },
        tooltip: 'New Contact',
        child: const Icon(Icons.add),
      ),
    );
```
diatas membuat tombol untuk menuju halaman create contact

2. Halaman Create Contact terdiri dari 2 kolom untuk mengisi nama dan nomor dan tombol untuk menyimpan kontak yang baru dibuat.

```dart
import 'package:flutter/material.dart'

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
diatas membuat widget untuk input nama

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
        border: const OutlineInputBorder(),
      ),
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
diatas membuat widget untuk input nomor telepon

```dart
class CreateContactScreen extends StatefulWidget {
  final ContactManager? manager;
  const CreateContactScreen({Key? key, this.manager}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var namedManager =
        ModalRoute.of(context)?.settings.arguments as ContactManager?;
    var defaultManager = Provider.of<ContactManager>(context, listen: false);
    var manager = (widget.manager ?? namedManager) ?? defaultManager;
    var contact = Contact();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Create Contact'),
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
                        manager.addContact(contact);
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

diatas menampilkan form yang mengabungkan widget input nama dan widget input nomor telepon

3. Simpan hasil kontak yang baru dibuat dalam sebuah Map untuk nama dan emailnya, kemudian dibawa kembali ke halaman home, lalu simpan ke sebuah List yang berisi daftar kontak yang sudah dibuat.

```dart
class Contact {
  String name;
  String noTelp;

  Contact({this.name = '', this.noTelp = ''});

  @override
  String toString() {
    return '''Nama : $name, No.Telp : $noTelp''';
  }
}
```

diatas membuat model contact berisi variabel dan constructor nama dan no telp

```dart
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
```
diatas membuat list kosong, dan membuat function untuk menambahkan ke dalam list kosong

4. Gunakan List diatas untuk menampilkan daftar kontak pada halaman Home

```dart
           ListView.builder(
              itemCount: manager.listContact.length,
              itemBuilder: (context, index) {
                var contact = manager.listContact[index];
                return ItemContact(contact: contact)
              },
            ),
```
diatas menampilkan list yang sudah di buat di halaman create contact

5. Ubah state di Ul dengan setState()
```dart
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        manager.addContact(contact);
                        AppRoute.back();
                      }
                    });
```
diatas proses perpindahan halaman create ke halaman home dengan membawa data contact

Hasil dari output dan run Task 01
![Gambar Task 01](/21_Flutter%20State%20Management%20(Provider)/screenshots/task01(a).png)
![Gambar Task 01](/21_Flutter%20State%20Management%20(Provider)/screenshots/task01(b).png)
![Gambar Task 01](/21_Flutter%20State%20Management%20(Provider)/screenshots/task01(c).png)


## Task 02 
**Membuat projek daftar kontak seperti soal nomor 1, dengan menggunakan state management Provider untuk mengubah state di UI**
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/contact.dart';
import '../utils/app_route.dart';
import '../utils/contact_manager.dart';
import 'components/name_contact_item.dart';
import 'components/notelp_contact_item.dart';
```
diatas mengimport beberapa class dan package

```dart
class CreateContactScreen extends StatefulWidget {
  final ContactManager? manager;
  const CreateContactScreen({Key? key, this.manager}) : super(key: key);

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var namedManager =
        ModalRoute.of(context)?.settings.arguments as ContactManager?;
    var defaultManager = Provider.of<ContactManager>(context, listen: false);
    var manager = (widget.manager ?? namedManager) ?? defaultManager;
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
                        manager.addContact(contact);
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
diatas membuat UI pada form menggunakan state management Provider

Hasil dari output dan run Task 02
![Gambar Task 02](/21_Flutter%20State%20Management%20(Provider)/screenshots/task02.png)