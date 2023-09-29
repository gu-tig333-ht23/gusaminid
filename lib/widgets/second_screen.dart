import 'package:flutter/material.dart';
import '../UI/data.dart';
import 'package:provider/provider.dart';
import '../UI/model.dart';

class SecondScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

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
//Här skriver man in det som ska lägga till i listan
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'What are you going to do?',
              ),
            ),
            SizedBox(height: 16.0),
//Knappen är till för att lägga till det man har skrivit
            ElevatedButton(
              onPressed: () {
                var title = titleController.text;
                Todo todo = Todo(title: title, done: false);
                context.read<TaskProvider>().addTodo(todo);
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
