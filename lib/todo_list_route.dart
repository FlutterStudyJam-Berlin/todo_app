import 'package:flutter/material.dart';
import 'todo_route.dart';
import 'todos_repository.dart';
import 'todo_row.dart';
import 'todo.dart';

class TodoListRoute extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListRoute> {
  List<Todo> _items = TodosRepository().getTodos();
  Todo _selectedTodo;

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
        selectedTodo: _selectedTodo,
        todoSelected: (selectedTodo) {
          setState(() {
            _selectedTodo = selectedTodo;
          });
        },
        todoChanged: (changedTodo) {
          setState(() {
            TodosRepository().updateTodo(changedTodo);
          });
        });
  }
}

typedef void TodoSelected(Todo todo);
typedef void TodoChanged(Todo todo);

class TodoList extends StatelessWidget {
  final List<Todo> items;
  final Todo selectedTodo;
  final TodoSelected todoSelected;
  final TodoChanged todoChanged;

  const TodoList(
      {@required this.items,
      this.selectedTodo,
      this.todoSelected,
      this.todoChanged})
      : assert(items != null);

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait ? buildListView() : buildExpansionPanelList();
  }

  SingleChildScrollView buildExpansionPanelList() {
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          child: ExpansionPanelList(
            children: items.map((todo) {
              return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return TodoRow(
                    todo: todo,
                    onTap: (todo) {
                      if (todoSelected != null) {
                        todoSelected(todo == selectedTodo ? null : todo);
                      }
                    },
                    onChanged: (newTodo) {
                      todoChanged(newTodo);
                    },
                  );
                },
                body: Text(todo.description),
                isExpanded: this.selectedTodo != null
                    ? this.selectedTodo.uuid == todo.uuid
                    : false,
              );
            }).toList(),
            expansionCallback: (index, isExpanded) {
              if (todoSelected != null) {
                todoSelected(!isExpanded ? items[index] : null);
              }
            },
          ),
        ),
      ),
    );
  }

  ListView buildListView() {
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
                onTap: (todo) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoRoute(
                        todo: todo,
                      ),
                    ),
                  );
                },
                onChanged: (newTodo) {
                  todoChanged(newTodo);
                }),
          );
        });
  }
}
