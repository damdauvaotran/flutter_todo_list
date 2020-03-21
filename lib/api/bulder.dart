import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/parser/todo_list_parser.dart';

//const URL = 'http://todo.mottrieuangi.codes';
const URL = 'http://10.0.2.2:8000';

final log = Logger('MyClassName');

Future<List<TodoModel>> fetchTodo() async {
  final response = await http.get('$URL/todo');
  return compute(parseTodoList, response.body);
}

Future<http.Response> createTodo({content, isDone}) {
  return http.post('$URL/todoList', body: {content: content, isDone: isDone});
}
