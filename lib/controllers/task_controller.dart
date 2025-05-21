import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/task_model.dart';

class TaskController extends GetxController {
  final RxMap<String, TaskModel> tasks = <String, TaskModel>{}.obs;

  final Box<TaskModel> _taskBox;

  TaskController(this._taskBox);

  @override
  void onInit() {
    super.onInit();
    _loadTasksFromHive();
  }

  void _loadTasksFromHive() {
    tasks.assignAll(
      _taskBox.toMap().map((key, value) => MapEntry(key.toString(), value)),
    );
  }

  void addTask(TaskModel task) {
    _taskBox.put(task.id, task);
    tasks.addAll({task.id: task});
    Get.snackbar('Success', 'Task "${task.title}" added!');
  }

  void toggleTaskCompletion(String taskId) {
    final task = _taskBox.get(taskId);

    if (task != null) {
      final updatedTask = task.copyWith(isComplete: !task.isComplete);
      _taskBox.put(task.id, updatedTask);
      tasks.refresh();
      Get.snackbar(
        'Status Updated',
        'Task "${task.title}" is now ${task.isComplete ? 'completed' : 'pending'}.',
      );
    } else {
      Get.snackbar('Status Error', 'Something went wrong!');
    }
  }

  void deleteTask(String taskId) {
    final String taskTitle = _taskBox.get(taskId)!.title;
    tasks.remove(taskId);
    _taskBox.delete(taskId);
    Get.snackbar('Deleted', 'Task "$taskTitle" removed.');
  }

  void updateTask(TaskModel newTask) {
    _taskBox.put(newTask.id, newTask);
    tasks.refresh();
    final String taskTitle = _taskBox.get(newTask.id)!.title;
    Get.snackbar('Updated', 'Task "$taskTitle" removed.');
  }
}
