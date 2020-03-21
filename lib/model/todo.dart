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

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromDBMap(Map<String, dynamic> json) {
    return TodoModel(
      content: json['content'] as String,
      isDone: json['is_done'] == 1,
    );
  }

  Map<String, dynamic> toDbMap() {
    return {
      'content': content,
      'is_done': isDone,
    };
  }
}
