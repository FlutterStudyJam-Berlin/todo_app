import 'package:flutter/material.dart';

import 'todo.dart';
import 'todo_row.dart';
import 'todos_repository.dart';

class TodoListRoute extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListRoute> {
  List<Todo> _items = TodosRepository().getTodos();
  Todo _expandedTodo;

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
      },
      todoExpanded: (todo) {
        setState(() {
          _expandedTodo = todo;
        });
      },
      expandedTodo: _expandedTodo,
    );
  }
}

typedef void TodoChanged(int index, Todo todo);
typedef void TodoExpanded(Todo todo);

class TodoList extends StatelessWidget {
  final List<Todo> items;
  final TodoChanged todoChanged;
  final Todo expandedTodo;
  final TodoExpanded todoExpanded;

  const TodoList({
    @required this.items,
    this.todoChanged,
    this.expandedTodo,
    this.todoExpanded,
  }) : assert(items != null);

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? buildPortraitLayout() : buildLandscapeLayout();
  }

  Widget buildPortraitLayout() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          if (!isExpanded) {
            todoExpanded(items[index]);
          } else {
            todoExpanded(null);
          }
        },
        children: items.map((todo) {
          return ExpansionPanel(
              isExpanded: todo.uuid == expandedTodo?.uuid,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return TodoRow(todo: todo);
              },
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(todo.description),
                ),
              ));
        }).toList(),
      ),
    );
  }

  ListView buildLandscapeLayout() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var todo = items[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(todo.uuid),
            onDismissed: (direction) {
              TodosRepository().deleteTodo(todo);
              var snackBar = SnackBar(
                content: Text("${todo.title} deleted"),
                action: SnackBarAction(
                    label: "undo",
                    onPressed: () {
                      TodosRepository().addTodo(todo);
                    }),
              );
              Scaffold.of(context).showSnackBar(
                snackBar,
              );
            },
            background: Container(
              color: Colors.pink[700],
            ),
            child: TodoRow(
                todo: todo,
                onChanged: (newTodo) {
                  todoChanged(index, newTodo);
                }),
          );
        });
  }
}
