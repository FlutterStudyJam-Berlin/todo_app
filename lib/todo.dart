import 'package:flutter/material.dart';

class Todo {
  final String uuid;
  final String title;
  final String description;
  final bool isDone;
  final IconData icon;

  const Todo({
    @required this.uuid,
    @required this.title,
    this.description = "",
    @required this.isDone,
    @required this.icon,
  })  : assert(uuid != null),
        assert(title != null),
        assert(isDone != null),
        assert(icon != null);
}
