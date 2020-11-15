import 'package:flutter/material.dart';
import 'package:todoapp/model/to_do.dart';

import 'add/add_to_do_page.dart';
import 'to_do_list_item.dart';
import '../service/to_do_list_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ToDoListProvider.getToDoList(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return _buildScaffold(snapshot.data);
        }
        return Scaffold(
          body: Center(
            child: Text('Loading...'),
          ),
        );
      },
    );
  }

  Widget _buildScaffold(List<ToDo> list) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => ToDoListItem(list[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddToDoPage(),
          ),
        ).then((title) {
          if(title != null) {
            setState(() {
              ToDoListProvider.toDoList.add(ToDo(title: title));
            });
          }
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
