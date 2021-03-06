import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_list/model/todo.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todoItem;
  final int id;
  final Function onDelete;
  final Function onEdit;

  TodoItem(
      {@required this.todoItem,
      @required this.id,
      @required this.onDelete,
      @required this.onEdit});

  void deleteTodo() {
    onDelete(id);
  }

  void editTodo() {
    onEdit(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: <Widget>[
                        Checkbox(value: todoItem.isDone),
                        Text(
                          todoItem.content,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ))),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: editTodo,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: deleteTodo,
                )
              ],
            ),
          ],
        ));
  }
}
