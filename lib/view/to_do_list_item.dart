import 'package:flutter/material.dart';
import 'package:todoapp/model/to_do.dart';

class ToDoListItem extends StatefulWidget {
  ToDoListItem(this.toDo) : super();

  final ToDo toDo;

  @override
  _ToDoListItemState createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {

  @override
  Widget build(BuildContext context) {
    var toDo = widget.toDo;
    return ListTile(
      title: Text('${toDo.title}'),
      enabled: !toDo.completed,
      trailing: Checkbox(
        value: toDo.completed,
        onChanged: (checked) {
          toDo.completed = checked;
          setState(() {
          });
        },
      ),
    );
  }
}
