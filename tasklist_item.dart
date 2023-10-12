import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_checkbox.dart';
import '../UI/data.dart';
import '../UI/model.dart';

class TaskListItem extends StatelessWidget {
  final Todo todo;

  TaskListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
//används för att visa om uppgiften är klar eller inte klar i form av en checkbox
      leading: CustomCheckBox(
        value: todo.done,
        onChanged: (newValue) {
          todo.done = newValue!;
          context.read<TaskProvider>().checkboxCompletion(todo);
        },
      ),
      title: Text(
        todo.title,
// sträcket som kommer när man bockar i en task
        style: todo.done
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              )
            : TextStyle(),
      ),
// delete knappen för att ta bort en task
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          final taskId = todo.id;
          if (taskId != null) {
            context.read<TaskProvider>().removeTodo(taskId);
          }
        },
      ),
    );
  }
}
