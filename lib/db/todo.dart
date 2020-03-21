import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:todo_list/model/todo.dart';

class TodoDatabase {
  static TodoDatabase _instance = null;
  Database database;

  TodoDatabase() {
    _openDatabase();
  }

  _openDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, content TEXT, is_done BOOLEAN)",
        );
      },
      version: 1,
    );
  }

  Future insert(TodoModel todo) async {
    await database.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future update(int id, TodoModel todo) async {
    await database.update(
      'todo', todo.toDbMap(), where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future delete(int id) async {
    await database.delete(
      'todo',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<TodoModel>> fetch() async {
    final List<Map<String, dynamic>> maps = await database.query('todo');
    return maps.map((e) {
      return TodoModel(
          id: e['id'], content: e['content'], isDone: e['is_done']);
    }).toList();
  }

  static TodoDatabase getInstance() {
    if (_instance == null) {
      _instance = new TodoDatabase();
    }
    return _instance;
  }
}
