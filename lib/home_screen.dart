import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';
import 'sort_provider.dart';
import 'custom_checkbox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 190, 218),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(100, 100, 0, 0),
                    items: [
                      PopupMenuItem(
                        value: 'All',
                        child: Text('All'),
                      ),
                      PopupMenuItem(
                        value: 'Done',
                        child: Text('Done'),
                      ),
                      PopupMenuItem(
                        value: 'Undone',
                        child: Text('Undone'),
                      ),
                    ],
                    elevation: 5.0,
                  ).then((selectedSorting) {
                    if (selectedSorting != null) {
                      Provider.of<SortingProvider>(context, listen: false)
                          .updateSorting(selectedSorting);
                    }
                  });
                },
              ),
              // l
            ],
          ),
        ],
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25,
              fontWeight: FontWeight.w500,
              // Text överest på första sidan
            ),
          ),
        ),
      ),
      body: TaskList(),
      floatingActionButton: AddTasks(),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer2<TaskProvider, SortingProvider>(
        builder: (context, taskProvider, sortingProvider, child) {
          final filteredTasks = taskProvider.tasks.where((task) {
            if (sortingProvider.currentSorting == 'Done') {
              return task.completed;
            } else if (sortingProvider.currentSorting == 'Undone') {
              return !task.completed;
            } else {
              return true;
            }
          }).toList();

          return ListView.separated(
            itemCount: filteredTasks.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final task = filteredTasks[index];
              return TaskListItem(task: task);
            },
          );
        },
      ),
    );
  }
}

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomCheckBox(
        value: task.completed,
        onChanged: (value) {
          Provider.of<TaskProvider>(context, listen: false)
              .toggleTaskCompletion(
            context.read<TaskProvider>().tasks.indexOf(task),
          );
        },
      ),
      title: Text(
        task.text,
        style: task.completed
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              )
            : TextStyle(),
      ),
      // sträcket som kommer när man bockar i en task
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          Provider.of<TaskProvider>(context, listen: false)
              .removeTask(context.read<TaskProvider>().tasks.indexOf(task));
          // delete knappen
        },
      ),
    );
  }
}

class AddTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(),
              // komma till andra sidan
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 155, 190, 218),
        icon: Icon(
          Icons.add,
          size: 24.0,
        ),
        label: Text('New Task'),
        // knappen för att lägga till en new task
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
        backgroundColor: const Color.fromARGB(255, 155, 190, 218),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'What are you going to do?',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(_taskController.text);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
