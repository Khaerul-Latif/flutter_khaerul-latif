import 'package:flutter/cupertino.dart';
import 'package:mini_project/models/todo_model.dart';
import 'package:mini_project/providers/user_provider.dart';
import 'package:mini_project/services/save_user_cache.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const databaseTodo = 'todo.db';
const tableTodo = 'todo';
const columnId = 'id';
const columnTitle = 'title';
const columnDone = 'done';
const columnDesc = 'description';
const columnDate = 'date';
const columnTime = 'time';
const columnName = 'name';

class DatabaseTodo {
  late Database db;

  Future<String> getDatabasePath() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, databaseTodo);
    return path;
  }

  Future<bool> initDatabase() async {
    String path = await getDatabasePath();

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableTodo (
            $columnId integer primary key autoincrement,
            $columnTitle text not null,
            $columnDone integer not null,
            $columnDesc text,
            $columnDate text not null,
            $columnTime text not null,
            $columnName text not null
          )
          ''');
      },
    );
    return db.isOpen;
  }

  Future<Todo?> insert(Todo todo) async {
    var id = await db.insert(tableTodo, todo.toMap(todo));
    return todo.copyWith(id: id);
  }

  Future<Todo?> getTodo(int id) async {
    List<Map<String, dynamic>> maps = await db.query(tableTodo, columns: [
      columnId,
      columnTitle,
      columnDate,
      columnDesc,
      columnTime,
      columnName
    ], whereArgs: [
      id
    ]);
    if (maps.length > 0) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Todo>?> fetchAll() async {
    final user = await SaveUserCache.getUser();
    var list = await db.query(tableTodo, where: 'name = ?', whereArgs: [user]);
    return list.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int?> getCount({required String name, required String date}) async {
    int? count = Sqflite.firstIntValue(await db.rawQuery(
        'select count(*) from $tableTodo where name =? and date=?',
        [name, date]));
    return count;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    return await db.update(tableTodo, todo.toMap(todo),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }
}