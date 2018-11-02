import 'package:flutter/material.dart';

import 'add_todo_route.dart';
import 'navutils.dart';
import 'screen.dart';
import 'todo_list_route.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListApp(),
    );
  }
}

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen(
      title: "Todo List",
      body: TodoListRoute(),
      fab: FloatingActionButton(
        onPressed: () => navigateTo(
              context,
              (context) => AddTodoRoute(),
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
