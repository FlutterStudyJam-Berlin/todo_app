import 'todo.dart';
import 'api.dart';

typedef void OnTodosChanged(List<Todo> todos);

class TodosRepository {
  static final TodosRepository _singleton = new TodosRepository._internal();

  factory TodosRepository() {
    return _singleton;
  }

  TodosRepository._internal();

  final _api = Api();

  List<Todo> _items = <Todo>[];

  List<OnTodosChanged> _subscribers = [];

  void load() {
    _api.getTodos().then(
          (todos) {
            print("$todos");
            _items = todos;
            _notifySubscribers();
          },
          onError: (error) => print("Error: $error"),
        );
  }

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
