import 'package:flutter/material.dart';

import 'navutils.dart';
import 'todo.dart';
import 'todo_route.dart';

typedef void TodoChanged(Todo newTodo);

class TodoRow extends StatelessWidget {
  final Todo todo;
  final TodoChanged onChanged;

  TodoRow({@required this.todo, this.onChanged}) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          (context) => TodoRoute(
                todo: todo,
              ),
        );
      },
      highlightColor: Colors.pinkAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(todo.icon),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
            Checkbox(
              onChanged: (isOn) {
                onChanged(todo.copy(isDone: isOn));
              },
              value: todo.isDone,
            ),
          ],
        ),
      ),
    );
  }
}
