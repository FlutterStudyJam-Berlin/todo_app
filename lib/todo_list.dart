import 'package:flutter/material.dart';
import 'todo.dart';

class TodoRow extends StatelessWidget {
  final Todo todo;

  TodoRow({@required this.todo}) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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

class TodoList extends StatelessWidget {
  final _items = <Todo>[
    Todo(title: "Foo 1", isDone: true, icon: Icons.ac_unit),
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
