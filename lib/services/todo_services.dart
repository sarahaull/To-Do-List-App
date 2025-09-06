import 'package:flutter/material.dart';

class Todo {
  final String name;
  bool isDone;
  bool isDeleted;

  Todo({required this.name, this.isDone = false, this.isDeleted = false});
}

class TodoServices extends ChangeNotifier {
  final List<Todo> _todos = [];
  final List<Todo> _history = [];

  List<Todo> get todos => _todos;
  List<Todo> get history => _history;

  void addTodo(String name) {
    final todo = Todo(name: name);
    _todos.add(todo);
    _history.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    todo.isDeleted = true; // tandai sebagai dihapus
    notifyListeners();
  }

  void toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
  }
}
