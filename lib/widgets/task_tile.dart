import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxCallback;
  final void Function() onLongPressCallback;

  const TaskTile(
      {super.key,
      required this.taskTitle,
      this.isChecked = false,
      required this.checkboxCallback,
      required this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            fontSize: 23.0,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: kMainOrange,
        onChanged: checkboxCallback,
      ),
    );
  }
}
