import 'package:flutter/material.dart';
import 'todo_route.dart';
import 'todo.dart';

class TodoRow extends StatelessWidget {
  final Todo todo;

  TodoRow({@required this.todo}) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodoRoute(todo: todo,)));
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
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
