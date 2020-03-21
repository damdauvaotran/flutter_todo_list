import 'dart:convert';

dynamic getData(String responseBody){
  final res = jsonDecode(responseBody);
  if (res['success']){
    return res['data'];
  }
  throw(res['message']);
}