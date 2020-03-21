import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_list/model/todo.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todoItem;
  final Function onDelete;
  final Function onEdit;
  final Function onCheck;

  TodoItem({
    @required this.todoItem,
    @required this.onDelete,
    @required this.onEdit,
    @required this.onCheck,
  });

  void deleteTodo() {
    onDelete(todoItem.id);
  }

  void editTodo() {
    onEdit(todoItem.id);
  }

  @override
  Widget build(BuildContext context) {
    print('todo Item' + todoItem.toString());
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
                        Checkbox(
                          value: todoItem.isDone,
                          onChanged: (isCheck) {
                            onCheck(todoItem, isCheck);
                          },
                        ),
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
