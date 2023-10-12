import 'package:flutter/material.dart';
import 'api.dart' as api;
import 'model.dart';
// data model pratar med api

class TaskProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

//get
  Future<void> fetchTodos() async {
    var todos = await api.getTodos();
    _todos = todos;
    notifyListeners();
  }

// post
  Future<void> addTodo(Todo todo) async {
    await api.postTodo(todo);
    fetchTodos();
  }

//delete
  Future<void> removeTodo(String id) async {
    await api.deleteTodo(id);
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

// Checkbox status put
  Future<void> checkboxCompletion(Todo todo) async {
    await api.updateTodoDone(todo);
    fetchTodos();
  }
}
