import 'package:todo_list/model/todo.dart';
import 'dart:convert';

import 'package:todo_list/parser/basic.dart';

List<TodoModel> parseTodoList(String responseBody) {
  final res = jsonDecode(responseBody);
  final parsed = getData(responseBody)['todoList'].cast<Map<String, dynamic>>();
  return parsed.map<TodoModel>((json) => TodoModel.fromJson(json)).toList();
}
