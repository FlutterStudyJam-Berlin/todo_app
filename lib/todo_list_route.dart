import 'package:flutter/material.dart';
import 'todos_repository.dart';
import 'todo_row.dart';
import 'todo.dart';

class TodoListRoute extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListRoute> {
  List<Todo> _items = TodosRepository().getTodos();

  @override
  void initState() {
    TodosRepository().subscribe((todos) {
      setState(() {
        _items = todos;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TodoList(
        items: _items,
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
          Todo item = items[index];
          return Dismissible(
            key: Key(item.uuid),
            onDismissed: (direction) {
              TodosRepository().deleteTodo(item);

              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("${item.title} deleted"),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      TodosRepository().addTodo(item);
                    },
                  ),
                ),
              );
            },
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            child: TodoRow(
                todo: item,
                onChanged: (newTodo) {
                  todoChanged(index, newTodo);
                }),
          );
        });
  }
}
