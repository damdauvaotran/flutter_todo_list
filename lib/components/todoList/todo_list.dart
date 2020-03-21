import 'package:flutter/material.dart';
import 'package:todo_list/components/todoList/todo_item.dart';
import 'package:todo_list/model/todo.dart';

class TodoList extends StatelessWidget {
  final List<TodoModel> todoList;
  final Function onDelete;
  final Function onEdit;
  final Function onCheck;

  TodoList({
    @required this.todoList,
    @required this.onEdit,
    @required this.onDelete,
    @required this.onCheck,
  });

  List buildTodoList() {
    return this.todoList.map((TodoModel todoItem) {
      return TodoItem(
        todoItem: todoItem,
        onDelete: onDelete,
        onEdit: onEdit,
        onCheck: onCheck,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: buildTodoList(),
      ),
    );
  }
}
