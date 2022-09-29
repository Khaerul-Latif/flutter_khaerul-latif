import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:section_18/screens/preview_post.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _images;
  String? _dateTime;
  Color _currentColor = Colors.white;
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget buildDatePicker(BuildContext context) {
    final format = DateFormat("dd/MM/yyyy");
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
            ),
          ],
        );
      },
    );
  }

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
}