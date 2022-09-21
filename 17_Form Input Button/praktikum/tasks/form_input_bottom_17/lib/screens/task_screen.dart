import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_input_bottom_17/models/task_manager.dart';
import 'package:form_input_bottom_17/screens/task_list_screen.dart';
import 'empty_task_screen.dart';
import 'task_item_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<TaskManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskItemScreen(
                onCreate: (task) {
                  manager.addTask(task);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<TaskManager>(
      builder: (context, manager, child) {
        if (manager.taskModels.isNotEmpty) {
          return TaskListScreen(
            manager: manager,
          );
        } else {
          return const EmptyTaskScreen();
        }
      },
    );
  }
}
