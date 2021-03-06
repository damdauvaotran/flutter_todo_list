import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';

class TodoDialog extends StatelessWidget {
  final _controller = new TextEditingController();
  final Function onEdit;
  final TodoModel todoItem;

  TodoDialog({@required this.onEdit, @required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit todo'),
      content: TextField(
        controller: _controller,
        autofocus: true,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('edit'),
          onPressed: () {
            onEdit(new TodoModel(content: _controller.text));
            _controller.clear();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
