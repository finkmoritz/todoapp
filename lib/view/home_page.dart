import 'package:flutter/material.dart';
import 'package:todoapp/model/to_do.dart';
import 'package:todoapp/view/to_do_list_item.dart';
import 'package:todoapp/view/to_do_list_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ToDo> toDoList = ToDoListProvider.getToDoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => ToDoListItem(toDoList[index]),
      ),
    );
  }
}

