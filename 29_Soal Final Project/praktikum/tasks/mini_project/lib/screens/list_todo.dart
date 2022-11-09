import 'package:flutter/material.dart';
import 'package:mini_project/extension/string_extension.dart';
import 'package:mini_project/models/todo_model.dart';
import 'package:mini_project/services/database_todo.dart';
import 'package:mini_project/shared/theme.dart';
import '../../extension/date_time_extension.dart';

class ListTodoScreen extends StatefulWidget {
  const ListTodoScreen({required this.user, Key? key}) : super(key: key);
  final String user;

  @override
  _ListTodoScreenState createState() => _ListTodoScreenState();
}

class _ListTodoScreenState extends State<ListTodoScreen> {
  int _selectedIndex = 0;

  DatabaseTodo databaseTodo = DatabaseTodo();

  int numberOfTask = 0;

  List<Todo> _listTodo = [];
  List<Todo> _initialListTodo = [];

  DateTime? _selectedDate;

  List<DateTime>? _listDate;
  String titleHeading = '';

  @override
  void initState() {
    databaseTodo.initDatabase().then(
          (value) => setNumberOfTask(
            DateTime.now(),
          ),
        );
    setListDate(
      DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
    super.initState();
  }

  setNumberOfTask(DateTime date) async {
    print('[setNumberOfTask]');
    final list = await databaseTodo.fetchAll();
    int size = list!
        .where(
          (element) =>
              (element.date!.split('-')[0] + element.date!.split('-')[1]) ==
              (date.year.toString() + date.getMonth()),
        )
        .toList()
        .length;
    int? count = await databaseTodo.getCount(
      name: widget.user,
      date: date.formatSaving(),
    );
    print('[setNumberOfTask] $count');
    setState(() {
      numberOfTask = size;
      titleHeading = date.getFullMonth() + ' ' + date.year.toString();

      _listTodo =
          list.where((todo) => todo.date == date.formatSaving()).toList();
      _initialListTodo = list
          .where((todo) =>
              (todo.date!.split('-')[0] + todo.date!.split('-')[1]) ==
              (date.year.toString() + date.getMonth()))
          .toList();
    });
    getTodo(list, date);
  }

  getTodo(List<Todo>? list, DateTime date) async {
    //temporary unused
    final list = await databaseTodo.fetchAll();
    setState(() {
      _listTodo = list!
          .where(
            (todo) => todo.date == date.formatSaving(),
          )
          .toList();
      _initialListTodo = list
          .where(
            (todo) =>
                (todo.date!.split('-')[0] + todo.date!.split('-')[1]) ==
                (date.year.toString() + date.getMonth()),
          )
          .toList();
    });
  }

  setListDate(DateTime date) {
    final lastDay = DateTime(date.year, date.month + 1, 0).day;
    List<DateTime> items = List.generate(
        lastDay, (index) => DateTime.utc(date.year, date.month, (index + 1)));
    setState(() {
      _listDate = items;
      _selectedDate = date;
    });
  }

  selectDate() async {
    final datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.parse('2022-01-01'),
        lastDate: DateTime.parse('2024-12-31'));
    if (datePicker != null && datePicker != _selectedDate) {
      setListDate(datePicker);
      setNumberOfTask(datePicker);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        title: Text(
          'Your Task',
          style: primaryWhiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: medium,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildHeading(),
                buildIconCalendar(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 65,
            child: _listDate == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: greenLight,
                    ),
                  )
                : ListView.builder(
                    itemCount: _listDate!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      print(_selectedDate);
                      print(_listDate![index]);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                            _selectedDate = _listDate![index];

                            _listTodo = _initialListTodo
                                .where(
                                  (todo) =>
                                      todo.date ==
                                      _listDate![index].formatSaving(),
                                )
                                .toList();
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: _selectedDate!.formatSaving() !=
                                  _listDate![index].formatSaving()
                              ? null
                              : BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${_listDate![index].day}',
                                style: TextStyle(
                                    color: _selectedDate!.formatSaving() ==
                                            _listDate![index].formatSaving()
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              Text(
                                _listDate![index].getShortDay(),
                                style: TextStyle(
                                    color: _selectedDate!.formatSaving() ==
                                            _listDate![index].formatSaving()
                                        ? Colors.white
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            width: size.width * 0.8,
            height: 0.8,
            color: Color(0xffC3C2C2),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Builder(
              builder: (context) {
                final data = _listTodo
                    .where(
                      (todo) => todo.date == _selectedDate!.formatSaving(),
                    )
                    .toList();

                return data.length == 0
                    ? Center(
                        child: Text('Data unavailable'),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          data.sort(
                            (a, b) => (Todo.toDateTime(a).compareTo(
                              Todo.toDateTime(b),
                            )),
                          );
                          data.sort((a, b) => a.time!
                              .getPeriod()
                              .split('')[0]
                              .toLowerCase()
                              .compareTo(b.time!
                                  .getPeriod()
                                  .split('')[0]
                                  .toLowerCase()));
                          return buildTaskCard(data[index]);
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconCalendar() {
    return InkWell(
      onTap: () => selectDate(),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: greenLight,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.2))
            ]),
        alignment: Alignment.center,
        child: Icon(
          Icons.calendar_today,
          color: Colors.white,
        ),
      ),
    );
  }

  Column buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${titleHeading}' , style: primaryBlackTextStyle.copyWith(fontSize: 24)),
        Text('$numberOfTask task today',
            style: TextStyle(
                color: Color(0xff838383), fontSize: 14, fontWeight: light)),
      ],
    );
  }

  Padding buildTaskCard(Todo todo) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Text(
              todo.time!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.clip,
            ),
          ),
          Container(
            height: 18,
            width: 0.8,
            margin: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffA19F9F),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(todo.title!),
                Text(
                  todo.description!,
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Color(0xff838383)),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
