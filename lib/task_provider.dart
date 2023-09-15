import 'package:flutter/material.dart';

class Task {
  String text;
  bool completed;

  Task(this.text, this.completed);
}

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String taskText) {
    final newTask = Task(taskText, false);
    _tasks.add(newTask);
    notifyListeners();
  }

  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }

  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].completed = !_tasks[index].completed;

      notifyListeners();
    }
  }
}
