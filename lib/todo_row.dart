import 'package:flutter/material.dart';
import 'todo_route.dart';
import 'todo.dart';

class _TodoRowState extends State<TodoRow> {
  Todo todo;

  _TodoRowState({@required this.todo}) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TodoRoute(
                      todo: todo,
                    )));
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
                setState(() {
                  todo = Todo(
                    isDone: isOn,
                    icon: todo.icon,
                    title: todo.title,
                    description: todo.description,
                  );
                });
              },
              value: todo.isDone,
            ),
          ],
        ),
      ),
    );
  }
}

class TodoRow extends StatefulWidget {
  final Todo todo;

  TodoRow({@required this.todo}) : assert(todo != null);

  @override
  _TodoRowState createState() => _TodoRowState(todo: todo);
}
