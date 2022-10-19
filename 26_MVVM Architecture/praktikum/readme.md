# (26) MVVM Architecture
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01
**Ubah seluruh halaman yang telah dibuat menjadi bentuk MVVM!**

![imgTask01](26_MVVM%20Architecture/screenshots/MVVM Flutter.png)

### Task 02
**Tambahkan sebuah halaman baru yang menggunakan ViewModel dari halaman lain!** 
```dart
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
```
diatas menambahkan class ContactViewModel yang berisi methode untuk menambahkan item