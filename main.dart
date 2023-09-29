import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';
import 'UI/data.dart';
import 'UI/sort_provider.dart';

void main() async {
  TaskProvider taskProvider = TaskProvider();
  taskProvider.fetchTodos();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => SortingProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My To-Do List',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 219, 236, 250)),
      home: HomeScreen(title: 'To-Do List'),
      debugShowCheckedModeBanner: false,
    );
  }
}
