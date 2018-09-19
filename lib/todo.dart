import 'package:flutter/material.dart';

class Todo {
  final String title;
  final bool isDone;
  final IconData icon;

  const Todo({
    @required this.title,
    @required this.isDone,
    @required this.icon,
  })  : assert(title != null),
        assert(isDone != null),
        assert(icon != null);
}
