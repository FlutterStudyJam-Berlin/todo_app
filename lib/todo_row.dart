import 'package:flutter/material.dart';
import 'todo.dart';

typedef void TodoSelected(Todo todo);
typedef void TodoChanged(Todo newTodo);

class TodoRow extends StatelessWidget {
  final Todo todo;
  final TodoSelected onTap;
  final TodoChanged onChanged;

  TodoRow({@required this.todo, this.onTap, this.onChanged}) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(todo);
        }
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
                onChanged(
                  Todo(
                    uuid: todo.uuid,
                    isDone: isOn,
                    icon: todo.icon,
                    title: todo.title,
                    description: todo.description,
                  ),
                );
              },
              value: todo.isDone,
            ),
          ],
        ),
      ),
    );
  }
}
