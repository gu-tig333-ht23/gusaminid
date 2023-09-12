import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MyApp(),
    ),
  );
}

// var counter = context.watch<MyState>()
// watch säger vi vill lyssna på förändringar
// i MyState om den förändras vi vill på kalla det igen
// context.read<MyState>().incrementetCounter();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My To-Do List',
      home: const HomeScreen(title: 'To-do List'),
      debugShowCheckedModeBanner: false,
    );
  }
}
