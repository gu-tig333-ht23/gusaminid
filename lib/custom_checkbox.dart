import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  CustomCheckBox({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Checkbox(
      value: value,
      activeColor: Colors.black,
      onChanged: (newValue) {
        onChanged?.call(newValue);
        taskProvider.toggleTaskCompletion();
      },
    );
  }
}

class StrikethroughText extends StatelessWidget {
  final String text;

  StrikethroughText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Text(
      text,
      style: TextStyle(
        decoration: taskProvider.isStriked
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}
