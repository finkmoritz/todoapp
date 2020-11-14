import 'dart:convert';

import 'package:http/http.dart';
import 'package:todoapp/model/to_do.dart';

class ToDoListProvider {

  static String url = 'https://jsonplaceholder.typicode.com/todos?userId=1';
  static List<ToDo> toDoList;

  static Future<List<ToDo>> getToDoList() async {
    if(toDoList == null) {
      Response response = await get(url);
      if(response.statusCode == 200) {
        Iterable toDoListIterator = json.decode(response.body);
        toDoList = toDoListIterator.map((toDo) => ToDo.fromJson(toDo)).toList();
      } else {
        throw Exception('Could not get ToDo\'s from API');
      }
    }
    return toDoList;
  }
}
