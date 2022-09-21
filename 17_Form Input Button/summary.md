# (17) Form Input Button
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Summary 
Section 17 ini saya belajar tentang Form Input Button, diantaranya:
1. Form digunakan untuk menerima isian dari pengguna dan isian data biasanya lebih dari satu.
2. Input adalah bagian bagian yang digunakan dalam membuat form, antara lain:
- TextFormField berfungsi sebagai input field, biasanya digunakan untuk input nama lengkap, searching, email, password dan input lainnya. 
- Radio berfungsi sebagai input yang hanya satu pilihan dari beberapa pilihan berbentuk bulat
- Checkbox berfungsi sebagai input yang bisa memilih lebih dari satu pilihan dari beberapa pilihan
- Dropdown berfungsi sebagai input yang hanya satu pilihan dari beberapa pilihan berbentuk kotak
3. Button adalah widget yang dapat melakukan suatu tekanan, ada beberapa macam button, antara lain:
- ElevatedButton, button yang bertipe teks
- IconButton, button yang bertipe icon

## Task
### Task 01
1. membuat Appbar bertulisan "Contact"
```dart
appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
```

2. Menampilkan data nama dan nomor telepon yang sudah di buat dan memberi kan tiap barisnya tombol icon untuk menghapus data nama dan nomor telepon
```dart
child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.nama + ' (' + task.noTelp + ')'),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text('Are you sure?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('NO'),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: const Text('YES'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete_forever_rounded),
          ),
        ],
      ),
```
#### Hasil Output dari Task 01
![imgTask01](screenshoot/task01(1).png)
![imgTask01](screenshoot/task01(2).png)

### Task 02
1. membuat Appbar bertulisan "Create A New Contacts"
```dart
appBar: AppBar(
        title: const Text('Create A New Contacts'),
      )
```

2. membuat fungsi untuk menampilkan sebuah form input nama dan nomor telepon
```dart
Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nama'),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _taskNameController,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'E.g. Latif',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text('No. Telp'),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _taskNameController2,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'E.g. 092193813123',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
```

3. membuat fungsi untuk membuat sebuah tombol bertuliskan "Submit"
```dart
Widget buildButton() {
    return ElevatedButton(
      child: const Text('Submit'),
      onPressed: () {
        final taskItem = TaskModel(
          id: const Uuid().v1(),
          nama: _taskNameController.text,
          noTelp: _taskNameController2.text,
        );
        widget.onCreate(taskItem);
      },
    );
  }
```
#### Hasil Output dari Task 02
![imgTask02](screenshoot/task02(1).png)
![imgTask02](screenshoot/task01(2-3).png)