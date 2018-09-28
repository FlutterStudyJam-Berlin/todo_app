import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'todo.dart';

typedef void OnTodosChanged(List<Todo> todos);

class TodosRepository {
  static final TodosRepository _singleton = new TodosRepository._internal();

  factory TodosRepository() {
    return _singleton;
  }

  TodosRepository._internal();

  List<Todo> _items = <Todo>[
    Todo(
        uuid: Uuid().v1(),
        title: "Foo 1",
        description: "This is a fancy description",
        isDone: true,
        icon: Icons.ac_unit),
    Todo(uuid: Uuid().v1(), title: "Foo 2", isDone: true, icon: Icons.ac_unit),
    Todo(uuid: Uuid().v1(), title: "Foo 3", isDone: true, icon: Icons.ac_unit),
    Todo(uuid: Uuid().v1(), title: "Foo 4", isDone: false, icon: Icons.ac_unit),
  ];

  List<OnTodosChanged> _subscribers = [];

  void addTodo(Todo todo) {
    _items.add(todo);

    _notifySubscribers();
  }

  void updateTodo(Todo changedTodo) {
    int index = _items.indexWhere((todo) {
      return todo.uuid == changedTodo.uuid;
    });

    if (index == -1) {
      return;
    }

    _items[index] = changedTodo;
    _notifySubscribers();
  }

  void deleteTodo(Todo deletedTodo) {
    int index = _items.indexWhere((todo) {
      return todo.uuid == deletedTodo.uuid;
    });

    if (index == -1) {
      return;
    }

    _items.removeAt(index);
    _notifySubscribers();
  }

  List<Todo> getTodos() => _items;

  void subscribe(OnTodosChanged onTodosChanged) =>
      _subscribers.add(onTodosChanged);

  void _notifySubscribers() {
    _subscribers.forEach((s) {
      s(_items);
    });
  }
}
