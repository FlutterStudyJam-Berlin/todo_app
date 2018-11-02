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
  })  : assert(title != null),
        assert(isDone != null),
        assert(icon != null),
        assert(uuid != null);

  Todo copy({
    String uuid,
    String title,
    String description,
    bool isDone,
    IconData icon,
  }) {
    return Todo(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      icon: icon ?? this.icon,
    );
  }
}
