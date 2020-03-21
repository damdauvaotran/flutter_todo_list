import 'package:flutter/cupertino.dart';

class TodoModel {
  int id;
  String content;
  bool isDone;

  TodoModel({@required this.id, this.content = '', this.isDone = false});

  TodoModel.fromTodo(TodoModel model2) {
    id = model2.id;
    content = model2.content;
    isDone = model2.isDone;
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      content: json['content'] as String,
      isDone: json['isDone'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromDBMap(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      content: json['content'] as String,
      isDone: json['is_done'] == 1,
    );
  }

  Map<String, dynamic> toDbMap() {
    return {
      'content': content,
      'is_done': isDone ? 1 : 0,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{ id: $id, content: $content, isDone: $isDone }';
  }
}
