import 'package:flutter/cupertino.dart';

class TodoListModel extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(0, "Todo 1", "Ivan", "First todo of the day", true),
    Todo(1, "Todo 2", "Ivan", "First todo of the day", true)
  ];

  List<Todo> get todos => _todos;

  void updateTodo(Todo todo) {
    todo.toggleCompleted();
    notifyListeners();
  }

  set todos(List<Todo> todos) {
    _todos = todos;
    notifyListeners();
  }

  int getTotalCompleted() {
    int total = 0;
    _todos.forEach((todo) {
      if (todo.completed) total++;
    });
    return total;
  }

  int getLenght() => _todos.length;

  Todo getById(int id) => _todos.firstWhere((element) => element.id == id);

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) {
    _todos.removeWhere((todoFromList) => todo.id == todoFromList.id);
    notifyListeners();
  }
}

@immutable
class Todo {
  final String title;
  final String author;
  final String description;
  final int id;
  bool completed;

  Todo(this.id, this.title, this.author, this.description, this.completed);

  void toggleCompleted() {
    this.completed = !this.completed;
  }

  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Todo && other.id == id;
}
