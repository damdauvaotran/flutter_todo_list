import 'package:flutter/material.dart';
import 'package:todo_list/components/todoList/todo_item.dart';
import 'package:todo_list/model/todo.dart';

class TodoList extends StatelessWidget {
  final List<TodoModel> todoList;
  final Function onDelete;
  final Function onEdit;

  TodoList(
      {@required this.todoList,
      @required this.onEdit,
      @required this.onDelete});

  List buildTodoList() {
    return this.todoList.map((TodoModel todoItem) {
      int index = todoList.indexOf(todoItem);
      return TodoItem(
        id: index,
        todoItem: todoItem,
        onDelete: onDelete,
        onEdit: onEdit,
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
