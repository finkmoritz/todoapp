import 'package:flutter/material.dart';
import 'package:todoapp/model/to_do.dart';
import 'package:todoapp/view/create/create_to_do_page.dart';

import 'list/to_do_list_item.dart';
import 'list/to_do_list_provider.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateToDoPage(),
            ),
        ).then((title) => setState(() {
          toDoList.add(ToDo(title: title));
        })),
        child: Icon(Icons.add),
      ),
    );
  }
}

