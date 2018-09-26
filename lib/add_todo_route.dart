import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'screen.dart';
import 'todo.dart';
import 'todos_repository.dart';

class AddTodoRoute extends StatefulWidget {
  @override
  AddTodoRouteState createState() => AddTodoRouteState();
}

class AddTodoRouteState extends State<AddTodoRoute> {
  bool _showEmptyError = false;
  String _todoText = "";

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: "Add To Do",
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            setState(() {
              _showEmptyError = _todoText.isEmpty;
              if (_todoText.isNotEmpty) {
                TodosRepository().addTodo(Todo(
                  uuid: Uuid().v1(),
                  title: _todoText,
                  isDone: false,
                  icon: Icons.access_alarm,
                ));

                Navigator.pop(context);
              }
            });
          },
        )
      ],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "What do you need to do?",
            errorText: _showEmptyError ? "Cannot add empty to do" : null,
          ),
          onChanged: (text) {
            _todoText = text;

            if (_showEmptyError) {
              setState(() {
                _showEmptyError = false;
              });
            }
          },
        ),
      ),
    );
  }
}
