import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:todo_list/model/todo.dart';

class TodoDatabase {
  static final TodoDatabase _instance = TodoDatabase._();
  static Database _database;

  TodoDatabase._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "todo_database.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE todo ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "content TEXT,"
          "is_done NUMERIC"
          ")");
    });
  }

  Future insert(TodoModel todo) async {
    Database db = await database;
    await db.insert(
      'todo',
      todo.toDbMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future update(int id, TodoModel todo) async {
    Database db = await database;
    await db.update(
      'todo', todo.toDbMap(), where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future delete(int id) async {
    Database db = await database;
    await db.delete(
      'todo',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<TodoModel>> fetch() async {
    Database db = await database;
    print(db);
    final List<Map<String, dynamic>> maps = await db.query('todo');
    return maps.map((e) {
      return TodoModel.fromDBMap(e);
    }).toList();
  }

  Future<List<TodoModel>> getAllTodo() async {
    final db = await database;
    print(db);
    var res = await db.query("todo");
    List<TodoModel> list =
        res.isNotEmpty ? res.map((c) => TodoModel.fromDBMap(c)).toList() : [];
    return list;
  }

  static TodoDatabase getInstance() {
    return _instance;
  }
}
