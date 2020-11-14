import 'package:flutter/material.dart';

class CreateToDoForm extends StatefulWidget {

  @override
  _CreateToDoFormState createState() => _CreateToDoFormState();
}

class _CreateToDoFormState extends State<CreateToDoForm> {

  final _formKey = GlobalKey<FormState>();
  String title = 'New To Do Item';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          TextFormField(
            initialValue: title,
            textAlign: TextAlign.center,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a title';
              }
              title = value;
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.pop(context, title);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
