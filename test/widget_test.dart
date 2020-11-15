import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todoapp/main.dart';
import 'package:todoapp/model/to_do.dart';
import 'package:todoapp/service/to_do_list_provider.dart';


void main() {
  testWidgets('Test common user journey', (WidgetTester tester) async {
    // Provide a dummy to do list (instead of HTTP request)
    ToDoListProvider.toDoList = [
      ToDo(title: 'TestTitle', completed: true),
    ];

    // Build our app.
    await tester.pumpWidget(ToDoApp());
    await tester.pumpAndSettle();

    // Verify that the To Do list is filled.
    expect(find.text('TestTitle'), findsOneWidget);

    // Tap the '+' floating action button.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that the text input field is already filled.
    expect(find.text('New To Do Item'), findsOneWidget);

    // Tap the 'Add' button.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that the new item was added to the To Do list.
    expect(find.text('TestTitle'), findsOneWidget);
    expect(find.text('New To Do Item'), findsOneWidget);
  });
}
