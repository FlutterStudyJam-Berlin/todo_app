import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'screen.dart';
import 'todo.dart';
import 'todo_list_repository.dart';

class AddTodoRoute extends StatefulWidget {
  @override
  _AddTodoRouteState createState() => _AddTodoRouteState();
}

class _AddTodoRouteState extends State<AddTodoRoute> {
  String _title = "";
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Screen(
      fab: FloatingActionButton(
        onPressed: () {
          TodosRepository().addTodo(Todo(
            uuid: Uuid().v1(),
            title: _title,
            description: _description,
            isDone: false,
            icon: Icons.map,
          ));

          Navigator.pop(context);
        },
        child: Icon(Icons.check),
      ),
      title: "Add Todo",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (newTitle) => setState(() {
                    _title = newTitle;
                  }),
              decoration: InputDecoration(
                hintText: "Add a title",
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              onChanged: (newDescription) => setState(() {
                    _description = newDescription;
                  }),
              decoration: InputDecoration(
                hintText: "Add a description",
              ),
            )
          ],
        ),
      ),
    );
  }
}
