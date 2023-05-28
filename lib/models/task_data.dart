import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/tasks.dart';

//turn this class into something that other class can listen to for changes:
class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(text: 'buy milk'),
    Task(text: 'buy mascara'),
    Task(text: 'buy nail polish'),
    Task(text: 'buy cake'),
  ];

  int get taskCount {
    return tasks.length;
  }

  //to be able to add to our list we must call notifyListeners
//so we must have a method to do that all:

  void addTask(String newTaskTitle) {
    final task = Task(text: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
