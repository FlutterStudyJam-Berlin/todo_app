import 'package:flutter/material.dart';
import 'todo.dart';
import 'screen.dart';

class TodoRoute extends StatelessWidget {
  final Todo todo;

  const TodoRoute({
    @required this.todo,
  }) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: todo.title,
      body: Text(todo.description),
    );
  }
}
