import 'package:flutter/material.dart';
import 'screen.dart';

class AddTodoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen(
      title: "Add To Do",
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {},
        )
      ],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "What do you need to do?",
          ),
        ),
      ),
    );
  }
}
