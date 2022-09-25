import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'newpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePages(),
    );
  }
}

class HomePages extends StatefulWidget {
  HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final _formKey = GlobalKey<FormBuilderState>();
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Column(
        children: [
          FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                FormBuilderTextField(
                  decoration: const InputDecoration(
                    label: Text('Nama'),
                  ),
                  name: 'name',
                ),
                FormBuilderDateTimePicker(
                  decoration: const InputDecoration(
                    label: Text('Date'),
                  ),
                  name: 'date',
                  inputType: InputType.date,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
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
                const SizedBox(height: 8),
                MaterialButton(
                  child: const Text('Simpan'),
                  color: Color.fromARGB(255, 189, 255, 252),
                  onPressed: () {
                    _formKey.currentState!.save();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Column(
                            children: [
                              Text(_formKey.currentState!.value['name']
                                  .toString()),
                              Text(_formKey.currentState!.value['date']
                                  .toString()),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
