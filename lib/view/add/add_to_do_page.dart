import 'package:flutter/material.dart';

import 'add_to_do_form.dart';

class AddToDoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create To Do'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: AddToDoForm(),
      ),
    );
  }
}
