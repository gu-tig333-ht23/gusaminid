import 'package:flutter/material.dart';
import 'second_screen.dart';

class AddTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton.extended(
//för att komma till andra sidan
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 155, 190, 218),
        icon: Icon(
          Icons.add,
          size: 24.0,
        ),
        label: Text('New Task'),
// knapp för att lägga till en ny task som tar dig till en ny sida
      ),
    );
  }
}
