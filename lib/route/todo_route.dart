import 'package:flutter/material.dart';
import 'package:todo_list/components/drawer/app_drawer.dart';
import 'package:todo_list/components/todoList/add_todo.dart';
import 'package:todo_list/components/todoList/todo_dialog.dart';
import 'package:todo_list/components/todoList/todo_list.dart';
import 'package:logging/logging.dart';
import 'package:todo_list/db/todo_db_privider.dart';
import 'package:todo_list/model/todo.dart';

final log = Logger('MyClassName');

class TodoRoute extends StatefulWidget {
  @override
  State<TodoRoute> createState() {
    // TODO: implement createState
    return TodoRouteState();
  }
}

class TodoRouteState extends State<TodoRoute> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<TodoModel> _todoList = [];

  void addTodo(String text) async {
    TodoModel newTodo = TodoModel(content: text);
    await TodoDatabase.getInstance().insert(newTodo);
    _fetch();
  }

  void deleteTodo(int id) async {
    await TodoDatabase.getInstance().delete(id);
    _fetch();
  }

  void _editTodo(int id, TodoModel todo) async {
    await TodoDatabase.getInstance().update(id, todo);
    _fetch();
  }

  void onEdit(int id) {
    print(id);
    showDialog(
        context: context,
        builder: (_) => TodoDialog(
            todoItem: _todoList.firstWhere((todo) => todo.id == id),
            onEdit: (TodoModel todo) {
              _editTodo(id, todo);
            }));
  }

  void onCheck(TodoModel todo, bool value) {
    print('value' + value.toString());
    TodoModel newTodo = TodoModel.fromTodo(todo);
    newTodo.isDone = value;
    _editTodo(newTodo.id, newTodo);
  }

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() async {
    List<TodoModel> list = await TodoDatabase.getInstance().fetch();
    print(list);
    setState(() {
      _todoList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Todo app'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: [
            AddTodo(onAddTodo: addTodo),
            TodoList(
              todoList: _todoList,
              onEdit: onEdit,
              onDelete: deleteTodo,
              onCheck: onCheck,
            ),
          ],
        ),
      ),
    );
  }
}
