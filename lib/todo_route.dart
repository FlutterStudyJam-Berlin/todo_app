import 'package:flutter/material.dart';
import 'todo.dart';
import 'screen.dart';

class TodoRoute extends StatefulWidget {
  final Todo todo;
  final void Function(Todo updatedTodo) onTodoUpdated;

  TodoRoute({
    @required this.todo,
    @required this.onTodoUpdated,
  })  : assert(todo != null),
        assert(onTodoUpdated != null);

  @override
  State<StatefulWidget> createState() {
    return _TodoRouteState();
  }
}

class _TodoRouteState extends State<TodoRoute> {
  Todo _todo;

  @override
  void initState() {
    _todo = widget.todo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: _todo.title,
      body: Column(
        children: <Widget>[
          Text(_todo.description),
          Checkbox(
            value: _todo.isDone,
            onChanged: (newValue) {
              setState(() {
                final updatedTodo = _todo.copy(isDone: newValue);
                _todo = updatedTodo;
                widget.onTodoUpdated(updatedTodo);
              });

              print("Just checked $newValue");
            },
          ),
        ],
      ),
    );
  }
}
