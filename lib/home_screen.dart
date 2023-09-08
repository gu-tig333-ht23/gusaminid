import 'package:flutter/material.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/strikethrough_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = [];
  List<bool> taskCompleted = [];

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
                onPressed: () {},
              ),
              // L
            ],
          ),
        ],
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: tasks.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CustomCheckBox(
                value: taskCompleted[index],
                onChanged: (value) {
                  setState(() {
                    taskCompleted[index] = value ?? false;
                  });
                },
              ),
              title: StrikethroughText(
                text: tasks[index],
                isStriked: taskCompleted[index],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    if (index >= 0 && index < tasks.length) {
                      tasks.removeAt(index);
                      taskCompleted.removeAt(index);
                    }
                  });
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          onPressed: () {
            // L
            setState(() {
              tasks.add('Ännu en grej som måste göras');
              taskCompleted.add(false);
            });
          },
          backgroundColor: Color.fromARGB(255, 150, 150, 150),
          icon: Icon(
            Icons.add,
            size: 24.0,
          ),
          label: Text('New Task'),
        ),
      ),
    );
  }
}
