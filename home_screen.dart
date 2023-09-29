import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/UI/data.dart';
import 'UI/sort_provider.dart';
import 'widgets/add_task.dart';
import 'widgets/task_list.dart';

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
//en filteringsknapp som när du har klickat på visar all, done, undone
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(1, 0, 0, 0),
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
            ),
          ),
        ),
      ),
//Laddar upp uppgifter som har lagts till i listan
//samt felmeddelande om fel uppstår
      body: FutureBuilder<void>(
        future: Provider.of<TaskProvider>(context, listen: false).fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return TaskList();
          }
        },
      ),
      floatingActionButton: AddTasks(),
    );
  }
}
