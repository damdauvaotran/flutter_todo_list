import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/api/bulder.dart';
import 'package:todo_list/components/drawer/app_drawer.dart';
import 'package:todo_list/components/todoList/add_todo.dart';
import 'package:todo_list/components/todoList/todo_dialog.dart';
import 'package:todo_list/components/todoList/todo_item.dart';
import 'package:todo_list/components/todoList/todo_list.dart';
import 'package:logging/logging.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/route/category_route.dart';

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

  void addTodo(String text) {
    setState(() {
      _todoList.add(new TodoModel(content: text));
    });
  }

  void deleteTodo(int id) {
    setState(() {
      _todoList.removeAt(id);
    });
  }

  void onEdit(int id) {
    print(id);
    showDialog(
        context: context,
        builder: (_) =>
            TodoDialog(todoItem: _todoList[id], onEdit: (TodoModel todo) {
              _editTodo(id, todo);
            }));
  }

  void _editTodo(int id, TodoModel todo) {
    this.setState(() {
      _todoList[id] = todo;
    });
  }

  @override
  void initState() {
    fetchTodo().then((res) {
      log.fine('Got the result: $res');
      print('Ok');
    }).catchError((err) {
      log.severe(err);
      print(err.toString());
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(err.toString()),
      ));
    });
    super.initState();
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
              ),
            ],
          )),
    );
  }
}
