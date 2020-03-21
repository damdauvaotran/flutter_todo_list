import 'package:flutter/cupertino.dart';

class TodoModel {
  int id;
  String content;
  bool isDone;

  TodoModel({@required this.id, this.content = '', this.isDone = false});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      content: json['content'] as String,
      isDone: json['isDone'] as bool,
    );
  }

  Map<String, dynamic> toDbMap() {
    return {
      'content': content,
      'is_done': isDone,
    };
  }
}
