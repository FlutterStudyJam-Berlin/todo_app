import 'package:flutter/material.dart';
import 'package:todo_app/todo_list.dart';

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Todo List"),
      ),
      body: TodoList() // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
