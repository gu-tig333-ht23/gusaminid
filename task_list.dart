import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/UI/data.dart';
import 'package:template/widgets/tasklist_item.dart';
import '../UI/sort_provider.dart';

//Lista över tasken baserat på aktuella sorteringsinställningar (Done, Undone eller All)
class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer2<TaskProvider, SortingProvider>(
        builder: (context, taskProvider, sortingProvider, child) {
          final filteredTasks = taskProvider.todos.where((todo) {
            if (sortingProvider.currentSorting == 'Done') {
              return todo.done;
            } else if (sortingProvider.currentSorting == 'Undone') {
              return !todo.done;
            } else {
              return true;
            }
          }).toList();

          return ListView.separated(
            itemCount: filteredTasks.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final todo = filteredTasks[index];
              return TaskListItem(todo: todo);
            },
          );
        },
      ),
    );
  }
}
