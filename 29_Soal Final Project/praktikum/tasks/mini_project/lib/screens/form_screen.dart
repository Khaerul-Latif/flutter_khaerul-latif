import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project/extension/date_time_extension.dart';
import 'package:mini_project/extension/string_extension.dart';
import 'package:mini_project/models/todo_model.dart';
import 'package:mini_project/screens/home_screen.dart';
import 'package:mini_project/services/database_todo.dart';
import 'package:mini_project/providers/user_provider.dart';
import 'package:mini_project/services/save_user_cache.dart';
import 'package:mini_project/shared/theme.dart';
import 'package:mini_project/shared/transition_screen.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  FormScreen({this.todo, Key? key}) : super(key: key);
  final Todo? todo;

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool isLoading = false;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  bool isDone = false;
  DatabaseTodo databaseTodo = DatabaseTodo();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    databaseTodo.initDatabase();
    initForm();
    super.initState();
  }

  initForm() {
    if (widget.todo != null) {
      titleController.text = widget.todo!.title!;
      descController.text = widget.todo!.description!;
      timeController.text = widget.todo!.time!;
      dateController.text = widget.todo!.date!;
      isDone = widget.todo!.done == 1;
    }
  }

  selectDate() async {
    final datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.parse('2022-10-01'),
        lastDate: DateTime.parse('2024-12-31'));
    if (datePicker != null && datePicker != _selectedDate) {
      setState(() {
        _selectedDate = datePicker;
        dateController.text = datePicker.formatSaving();
      });
      print(datePicker);
    }
  }

  selectTime() async {
    final timePicker =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (timePicker != null && timePicker != _selectedTime) {
      setState(() {
        _selectedTime = timePicker;
        timeController.text = timePicker.format(context).formatSaving();
      });
    }
  }

  save() async {
    setState(() {
      isLoading = true;
    });
    final user = await SaveUserCache.getUser();
    final todo = widget.todo != null
        ? widget.todo!.copyWith(
            title: titleController.text,
            date: dateController.text,
            time: timeController.text,
            description: descController.text)
        : Todo(
            date: dateController.text,
            time: timeController.text,
            title: titleController.text,
            description: descController.text,
            userId: user!,
          );
    final result = widget.todo != null
        ? await databaseTodo.update(todo)
        : await databaseTodo.insert(todo);

    setState(() {
      isLoading = false;
    });
    if (result != null) {
      Get.snackbar(widget.todo != null ? 'Update Task' : 'Create Task',
          '${widget.todo != null ? "Update" : "Create"} Task Successfully',
          backgroundColor: redLight, colorText: Colors.white);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: primaryWhite,
            size: 30,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: (Text(
          widget.todo != null ? 'Update Task' : 'Create New Task',
          style: primaryWhiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: medium,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel(name: 'Date'),
                  Row(
                    children: [
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: buildInput(
                            controller: dateController,
                            readOnly: true,
                            hintText: 'Date'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: IconButton(
                          onPressed: () => selectDate(),
                          icon: Icon(Icons.calendar_today_rounded),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel(name: 'Time'),
                  Row(
                    children: [
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: buildInput(
                            controller: timeController,
                            readOnly: true,
                            hintText: 'Time'),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: IconButton(
                          onPressed: () => selectTime(),
                          icon: Icon(Icons.timer_sharp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel(name: 'Title'),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: buildInput(
                            controller: titleController, hintText: 'Title'),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel(name: 'Description'),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: buildInput(
                          controller: descController,
                          height: 100,
                          inputType: TextInputType.multiline,
                          hintText: 'Description',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: isLoading
                  ? CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.3)),
                      onPressed: () => save(),
                      child: Text(
                        widget.todo != null ? 'Update Task' : 'Create Task',
                        style: primaryWhiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Text buildLabel({String? name}) {
    return Text(
      name!,
      style: primaryTextStyle.copyWith(
        fontSize: 14,
        fontWeight: semiBold,
      ),
    );
  }

  Container buildInput(
      {double? height = 50,
      TextInputType? inputType,
      bool readOnly = false,
      TextEditingController? controller,
      String? hintText}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffEDEDED),
        ),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        style: redLightTextStyle.copyWith(
          fontSize: 20,
          fontWeight: light,
        ),
        readOnly: readOnly,
        keyboardType: inputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: redLightTextStyle.copyWith(
            color: redLight.withOpacity(0.5),
            fontSize: 14,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
