import 'package:flutter/material.dart';
import 'todo_row.dart';
import 'todo.dart';

class TodoListRoute extends StatelessWidget {
  final _items = const <Todo>[
    Todo(title: "Foo 1", description: "This is a fancy description", isDone: true, icon: Icons.ac_unit),
    Todo(title: "Foo 2", isDone: true, icon: Icons.ac_unit),
    Todo(title: "Foo 3", isDone: true, icon: Icons.ac_unit),
    Todo(title: "Foo 4", isDone: false, icon: Icons.ac_unit),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoRow(
            todo: _items[index],
          );
        });
  }
}
