import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckBox({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      activeColor: Colors.black,
      onChanged: onChanged,
    );
  }
}
