import 'package:mini_project/extension/string_extension.dart';
import 'package:mini_project/services/database_todo.dart';

class Todo {
  final int? id;
  final String? title;
  final String? description;
  final String? date;
  final String? time;
  final int? done;
  final String userId;

  Todo({
    this.id,
    this.title,
    this.done = 0,
    this.date,
    this.time,
    this.description,
    required this.userId,
  });

  Todo copyWith({
    int? id,
    String? title,
    int? done,
    String? description,
    String? date,
    String? time,
  }) {
    return Todo(
      userId: userId,
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap(Todo todo) {
    var map = {
      columnTitle: todo.title,
      columnDone: todo.done,
      columnDate: todo.date,
      columnDesc: todo.description,
      columnTime: todo.time,
      columnName: todo.userId
    };
    if (todo.id != null) {
      map[columnId] = todo.id;
    }
    return map;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        userId: map[columnName],
        id: map[columnId],
        title: map[columnTitle],
        done: map[columnDone],
        description: map[columnDesc],
        date: map[columnDate],
        time: map[columnTime]);
  }

  static DateTime toDateTime(Todo todo) {
    return DateTime.parse(
        '${todo.date!} ${todo.time!.getHour()}:${todo.time!.getMinute()}:00');
  }
}
