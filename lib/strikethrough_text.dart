import 'package:flutter/material.dart';

class StrikethroughText extends StatelessWidget {
  final String text;
  final bool isStriked;

  const StrikethroughText({
    required this.text,
    required this.isStriked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration:
            isStriked ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}
