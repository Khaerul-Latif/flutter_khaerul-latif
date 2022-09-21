import 'package:flutter/material.dart';
import 'package:form_input_bottom_17/models/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskItemScreen extends StatefulWidget {
  final Function(TaskModel) onCreate;
  const TaskItemScreen({
    Key? key,
    required this.onCreate,
  }) : super(key: key);

  @override
  _TaskItemScreenState createState() => _TaskItemScreenState();
}

class _TaskItemScreenState extends State<TaskItemScreen> {
  final _taskNameController = TextEditingController();
  String _nama = '';
  final _taskNameController2 = TextEditingController();
  String _noTelp = '';

  @override
  void initState() {
    super.initState();
    _taskNameController.addListener(() {
      setState(() {
        _nama = _taskNameController.text;
      });
    });
    _taskNameController2.addListener(() {
      setState(() {
        _noTelp = _taskNameController2.text;
      });
    });
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskNameController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create A New Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNameField(),
            const SizedBox(
              height: 16,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

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
}
