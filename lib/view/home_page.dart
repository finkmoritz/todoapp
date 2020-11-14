import 'package:flutter/material.dart';
import 'package:todoapp/model/to_do.dart';
import 'package:todoapp/view/create/create_to_do_page.dart';

import 'list/to_do_list_item.dart';
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
            builder: (context) => CreateToDoPage(),
          ),
        ).then((title) => setState(() {
          ToDoListProvider.toDoList.add(ToDo(title: title));
        })),
        child: Icon(Icons.add),
      ),
    );
  }
}
