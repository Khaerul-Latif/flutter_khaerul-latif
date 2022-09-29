# (18) Form Picker

## Data diri

Nomor Peserta : 1_013FLB_50 <br />
Nama Peserta : Khaerul Latif

## TASK

### TASK 01

**membuat halaman form yang berjudul / Appbar 'Create Post'**

```dart
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
```

diatas mengimport beberapa package diantaranya intl, file_picker, date_field, dan flutter_colorpicker

```dart
  String? _images;
  String? _dateTime;
  Color _currentColor = Colors.white;
  final TextEditingController _controller = TextEditingController();
```

diatas membuat variable images dan datetime tipe data String, membuat variable currentColor tipe data Color dan nilainya adalah putih. membuat variabel controller tipe data constanta dan menyimpan data TextEditingController()

```dart
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFilePicker(context),
                const SizedBox(
                  height: 10,
                ),
                buildDatePicker(context),
                const SizedBox(
                  height: 10,
                ),
                buildColorPicker(context),
                const SizedBox(
                  height: 10,
                ),
                buildTextField(context),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => PreviewPost(
                                  image: _images!,
                                  time: _dateTime.toString(),
                                  controller: _controller,
                                  currentColor: _currentColor,
                                )),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
```

diatas membuat column yang berisi beberapa widget terpisah

```dart
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      _images = _getFile(file);
    });
  }

  _getFile(PlatformFile file) {
    return file.path;
  }

  _updateNameFile() {
    if (_images == null) {
      return '';
    } else {
      return _images.toString();
    }
  }
```

diatas membuat beberapa fungsi

- pickFile untuk memilih satu file berjenis gambar
- getFile untuk mengambil file pada device
- updateNameFile untuk mengambil nama dari file yang di pilih, jika belum memlilih makan akan kosong

```dart
  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Cover", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[600],
            ),
            onPressed: () {
              _pickFile();
            },
            child: const Text("Pilih File"),
          ),
        ),
        Center(
          child: Text(
            _updateNameFile(),
          ),
        )
      ],
    );
  }
```

diatas proses membuat widget file picker

```dart
  Widget buildDatePicker(BuildContext context) {
    final format = DateFormat("dd/mm/yyyy");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Publish At",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        DateTimeFormField(
          decoration: InputDecoration(
              hintText: 'dd/mm/yyyy',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          dateFormat: format,
          mode: DateTimeFieldPickerMode.date,
          autovalidateMode: AutovalidateMode.disabled,
          validator: (value) {
            if (value == null) {
              return 'Required';
            } else {
              return null;
            }
          },
          onDateSelected: (value) {
            setState(
              () {
                _dateTime = "${value.day}-${value.month}-${value.year}";
              },
            );
          },
        ),
      ],
    );
  }
```

diatas proses membuat widget date picker

```dart
  _getColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pick Color"),
          content: BlockPicker(
            pickerColor: _currentColor,
            onColorChanged: (color) {
              setState(
                () {
                  _currentColor = color;
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        );
      },
    );
  }
```

diatas membuat fungsi untuk memiilih color

```dart
  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Color Theme",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                _getColor(context);
              },
              child: const Text(
                "Pick Color",
                style: TextStyle(color: Color.fromARGB(255, 105, 100, 100)),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: _currentColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          width: double.infinity,
          height: 50,
        ),
      ],
    );
  }
```

diatas proses membuat widget color picker

```dart
  Widget buildTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Caption", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          maxLines: 6,
          maxLength: 300,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      ],
    );
  }
```
diatas proses membuat widget caption

Hasil run dan output Task 01
![img task01](/18_Form%20Picker/screenshoot/task01_A.png)
![img task01](/18_Form%20Picker/screenshoot/task01_B.png)
### TASK 02

```dart
  final String image;
  final String time;
  final Color currentColor;
  final TextEditingController controller;

  const PreviewPost(
      {Key? key,
      required this.image,
      required this.time,
      required this.currentColor,
      required this.controller})
      : super(key: key);
```

diatas membuat beberapa variable dan constructor yang terdapat pada class PreviewPost

- image dan time tipe data String
- currentColor tipe data Color
- controller tipe data TextEditingController

```dart
    Scaffold(
      appBar: AppBar(
        title: const Text("Preview Post"),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(widget.image),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Published: ${widget.time}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 95, 92, 92),
                      ),
                    ),
                  ),
                  const Text(
                    "Color",
                    style: TextStyle(
                      color: Color.fromARGB(255, 95, 92, 92),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: widget.currentColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.controller.text,
                style: const TextStyle(
                  color: Color.fromARGB(255, 95, 92, 92),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
```

diatas widget yang digunakan untuk mencetak input di widget Home

Hasil run dan output Task 02
![img task01](/18_Form%20Picker/screenshoot/task02.png)