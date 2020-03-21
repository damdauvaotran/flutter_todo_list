import 'package:flutter/material.dart';
import 'dart:convert';

class AddTodo extends StatefulWidget {
  final Function onAddTodo;

  AddTodo({@required this.onAddTodo});

  @override
  State<AddTodo> createState() {
    return AddTodoState();
  }

}

class AddTodoState extends State<AddTodo> {
  String _value = '';
  final TextEditingController todoContentController =
      new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void addTodo() {
    if (_formKey.currentState.validate()) {
      widget.onAddTodo(todoContentController.text);
      todoContentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                controller: todoContentController,
                decoration: const InputDecoration(
                  hintText: 'What do you gonna do',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )),
              RaisedButton(onPressed: addTodo, child: Text('Add')),
            ],
          ),
        )
    );
  }
}
