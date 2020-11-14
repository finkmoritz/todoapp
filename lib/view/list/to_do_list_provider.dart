import 'package:todoapp/model/to_do.dart';

class ToDoListProvider {

  static List<ToDo> getToDoList() {
    return [
      ToDo(title: 'Laundry', completed: true),
      ToDo(title: 'Homework', completed: false),
      ToDo(title: 'Groceries', completed: false),
    ];
  }
}
