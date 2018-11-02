import 'package:flutter/material.dart';

import 'todo.dart';
import 'todo_row.dart';
import 'todo_list_repository.dart';

class TodoListRoute extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListRoute> {
  @override
  Widget build(BuildContext context) {
    return TodoList(
        items: TodosRepository().getTodos(),
        todoChanged: (index, changedTodo) {
          setState(() {
            TodosRepository().updateTodo(changedTodo);
          });
        });
  }
}

typedef void TodoChanged(int index, Todo todo);

class TodoList extends StatelessWidget {
  final List<Todo> items;
  final TodoChanged todoChanged;

  const TodoList({@required this.items, this.todoChanged})
      : assert(items != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoRow(
              todo: items[index],
              onChanged: (newTodo) {
                todoChanged(index, newTodo);
              });
        });
  }
}
