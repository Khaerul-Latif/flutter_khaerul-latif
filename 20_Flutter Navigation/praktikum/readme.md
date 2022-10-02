# (20) Flutter Navigation
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task 
### Task 01
**Membuat halaman Contacts yang menampilkan data contacts menggunakan List View dan letakkan button untuk membuka halaman Create Contact!**
```dart
class ContactsModel {
  String name, phone;

  ContactsModel({required this.name, required this.phone});
}

List<ContactsModel> items = [
  ContactsModel(
    name: "Khaerul Latif",
    phone: "08986865095",
  ),
  ContactsModel(
    name: "Fajar Maulana",
    phone: "08738127391",
  ),
  ContactsModel(
    name: "Salma Jainati",
    phone: "081615959962",
  ),
  ContactsModel(
    name: "George Jamil",
    phone: "089639069386",
  ),
  ContactsModel(
    name: "Soleha Baron",
    phone: "08321312",
  ),
  ContactsModel(
    name: "Dwi Jatmiko",
    phone: "08389123659",
  ),
  ContactsModel(
    name: "Dendi Iskandar",
    phone: "08873198132",
  ),
  ContactsModel(
    name: "Ayu Natalia",
    phone: "08924948883",
  ),
  ContactsModel(
    name: "Jihand Alya",
    phone: "08554435823",
  ),
  ContactsModel(
    name: "Melynda Beriana",
    phone: "0823664466373",
  ),
];
```
diatas membuat class model berisi nama dan nomor telepon.

```dart
import 'dart:math';
```
diatas mengimport math.

```dart
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
```
diatas membuat halaman 'Contact' untuk menampilkan list yang sudah di buat sebelumnya.

```dart
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
```
diatas membuat icon button untuk membuka halaman 'Create Contact'

```dart
class _FormClassState extends State<FormClass> {
  String? nama;
  String? phone;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Create New Contact"), centerTitle: true),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama",
                  icon: const Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  } else {
                    setState(() {
                      nama = value;
                    });
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Nomor Telpon",
                  icon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nomor tidak boleh kosong';
                  } else {
                    setState(() {
                      phone = value;
                    });
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    items.add(ContactsModel(name: nama!, phone: phone!));
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushNamed('/home')
                        .then((value) => setState(() {}));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
diatas membuat halaman 'Create New Contact'.

Hasil dari run dan output Task 01
![image Task 01](/20_Flutter%20Navigation/screenshoot/task01(A).png)
![image Task 01](/20_Flutter%20Navigation/screenshoot/task01(A).png)

### Task 02
**Membuat naviagtion dengan menggunakan named routes**
```dart
routes: {
        '/home': ((context) => const Home()),
        '/form-class': ((context) => const FormClass())
      },
```
diatas mendaftar name route pada beberapa widget / halaman

```dart
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
```
diatas membuat icon button dengan nama Icon (add_outlined) untuk membuka halaman 'Create New Contact'

```dart
              ElevatedButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    items.add(ContactsModel(name: nama!, phone: phone!));
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushNamed('/home')
                        .then((value) => setState(() {}));
                  }
                },
              ),
```
diatas membuat button dengan nama Submit untuk membuka halaman 'Contact'

Hasil dari run dan output Task 02
![image Task 02](/20_Flutter%20Navigation/screenshoot/task02(A).png)
![image Task 02](/20_Flutter%20Navigation/screenshoot/task02(B).png)