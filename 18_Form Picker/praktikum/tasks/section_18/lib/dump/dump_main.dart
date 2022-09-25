import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Post',
      color: Color(0xff1654F6),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Create Post'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pick Files'),
                ElevatedButton(
                  child: const Text('Pick files'),
                  onPressed: () {
                    _pickFile();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tanggal Posting'),
                TextButton(
                  child: const Text('Select'),
                  onPressed: () async {
                    final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5),
                    );

                    setState(
                      () {
                        if (selectDate != null) {
                          _dueDate = selectDate;
                        }
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Pilih Warna'),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_currentColor),
                ),
                child: const Text('Pick Color'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick Color'),
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
                      );
                    },
                  );
                },
              ),
            ),
            const Text('Caption :'),
            const SizedBox(height: 8),
            Column(
              children: <Widget>[
                Card(
                  color: Colors.white,
                  child: TextField(
                    maxLines: 8,
                    // decoration: InputDecoration.collapsed(hintText: 'Enter'),
                  ),
                ),
              ],
            ),
            Center(
              child:
                  ElevatedButton(child: const Text('Submit'), onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

void _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result == null) return;

  final file = result.files.first;
  _openFile(file);
}

void _openFile(PlatformFile file) {
  OpenFile.open(file.path as String);
}
