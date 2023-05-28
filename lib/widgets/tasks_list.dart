import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/tasks.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        //replaces 'Provider.of<TaskData>(context).tasks.' with 'taskData.tasks.'
        return ListView.builder(
          itemBuilder: (context, index) {
            final Task task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.text,
              isChecked: task.isDone,
              checkboxCallback: (checkBoxState) {
                taskData.updateTask(task);
              },
              onLongPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
