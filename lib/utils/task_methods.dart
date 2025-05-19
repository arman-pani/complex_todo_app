import 'package:hive/hive.dart';
import 'package:todo_app/models/task_model.dart';

class TaskMethods {
  final tasksBox = Hive.box<TaskModel>('tasks');
  void addTaskToLocalDB(TaskModel newTask) {
    tasksBox.put(newTask.id, newTask);
  }

  void removeTaskFromLocalDB(String taskId) {
    tasksBox.delete(taskId);
  }

  void toggleTaskCompletion(String taskId) {
    final task = tasksBox.get(taskId);
    if (task != null) {
      final updatedTask = task.copyWith(isComplete: !task.isComplete);
      tasksBox.put(taskId, updatedTask);
    }
  }

  TaskModel? getTaskInfoById(String taskId) {
    return tasksBox.get(taskId);
  }
}
