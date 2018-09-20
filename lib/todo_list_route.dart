import 'package:flutter/material.dart';
import 'todo_row.dart';
import 'todo.dart';

class TodoListRoute extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListRoute> {
  List<Todo> _items = <Todo>[
    Todo(title: "Foo 1", description: "This is a fancy description", isDone: true, icon: Icons.ac_unit),
    Todo(title: "Foo 2", isDone: true, icon: Icons.ac_unit),
    Todo(title: "Foo 3", isDone: true, icon: Icons.ac_unit),
    Todo(title: "Foo 4", isDone: false, icon: Icons.ac_unit),
  ];

  @override
  Widget build(BuildContext context) {
    return TodoList(items: _items, todoChanged: (index, changedTodo) {
      setState(() {
        _items[index] = changedTodo;
      });
    });
  }
}

typedef void TodoChanged(int index, Todo todo);

class TodoList extends StatelessWidget {
  final List<Todo> items;
  final TodoChanged todoChanged;

  const TodoList({@required this.items, this.todoChanged}) : assert(items != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoRow(
            todo: items[index],
            onChanged: (newTodo) {
              todoChanged(index, newTodo);
            }
          );
        });
  }
}
