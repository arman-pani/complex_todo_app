import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/filter_drop_down_button.dart';

class TaskController extends GetxController {
  final RxMap<String, TaskModel> tasks = <String, TaskModel>{}.obs;

  final RxList<TaskModel> homeFilteredTasks = <TaskModel>[].obs;

  final Rx<DateTime> selectedCalendarDateTime = DateTime.now().obs;

  final Rx<bool> showCalendarCompleted = false.obs;

  final Rx<FilterLabel> currentFilterLabel = FilterLabel.all.obs;

  final Rx<String> currentSearchInput = ''.obs;

  final RxList<TaskModel> calendarFilteredTasks = <TaskModel>[].obs;

  final Box<TaskModel> _taskBox;

  TaskController(this._taskBox);

  @override
  void onInit() {
    super.onInit();
    _loadTasksFromHive();
    _loadInitialTasksForHome();
    _loadInitialTasksForCalendar();
  }

  void _loadInitialTasksForCalendar() {
    filterTasksByDateAndCompletion();
  }

  void _loadInitialTasksForHome() {
    filterTaskInHomePage();
  }

  void _loadTasksFromHive() {
    tasks.assignAll(
      _taskBox.toMap().map((key, value) => MapEntry(key.toString(), value)),
    );
  }

  void addTask(TaskModel task) {
    _taskBox.put(task.id, task);
    tasks.addAll({task.id: task});
    filterTaskInHomePage();
    filterTasksByDateAndCompletion();
  }

  void toggleTaskCompletion(String taskId) {
    final task = _taskBox.get(taskId);

    if (task != null) {
      final updatedTask = task.copyWith(isComplete: !task.isComplete);
      _taskBox.put(task.id, updatedTask);
      tasks[task.id] = updatedTask;
      tasks.refresh();

      filterTaskInHomePage();
      filterTasksByDateAndCompletion();

      Get.snackbar(
        'Status Updated',
        'Task "${task.title}" is now ${updatedTask.isComplete ? 'completed' : 'pending'}.',
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
    tasks[newTask.id] = newTask;
    _taskBox.put(newTask.id, newTask);
    tasks.refresh();
    filterTaskInHomePage();
    filterTasksByDateAndCompletion();
    final String taskTitle = _taskBox.get(newTask.id)!.title;
    Get.snackbar('Updated', 'Task "$taskTitle" removed.');
  }

  void filterTasksByDateAndCompletion({
    DateTime? selectedDateTime,
    bool? showCompleted,
  }) {
    selectedCalendarDateTime.value =
        selectedDateTime ?? selectedCalendarDateTime.value;
    showCalendarCompleted.value = showCompleted ?? showCalendarCompleted.value;

    calendarFilteredTasks.assignAll(
      tasks.values.where((task) {
        final isSameDate =
            task.date.year == selectedCalendarDateTime.value.year &&
            task.date.month == selectedCalendarDateTime.value.month &&
            task.date.day == selectedCalendarDateTime.value.day;

        final isCompletedMatch = showCalendarCompleted.value
            ? task.isComplete
            : !task.isComplete;

        return isSameDate && isCompletedMatch;
      }).toList(),
    );
  }

  void filterTaskInHomePage({FilterLabel? label, String? searchInput}) {
    DateTime now = DateTime.now();

    currentFilterLabel.value = label ?? currentFilterLabel.value;

    currentSearchInput.value = searchInput ?? currentSearchInput.value;

    List<TaskModel> filteredTasksBySearch;

    if (currentSearchInput.value != '') {
      filteredTasksBySearch = tasks.values.where((task) {
        return task.title.toLowerCase().contains(
          currentSearchInput.value.toLowerCase(),
        );
      }).toList();
    } else {
      filteredTasksBySearch = tasks.values.toList();
    }

    switch (currentFilterLabel.value) {
      case FilterLabel.all:
        homeFilteredTasks.assignAll(filteredTasksBySearch);
        break;

      case FilterLabel.today:
        homeFilteredTasks.assignAll(
          filteredTasksBySearch.where((task) {
            return task.date.year == now.year &&
                task.date.month == now.month &&
                task.date.day == now.day;
          }).toList(),
        );
        break;
      case FilterLabel.tomorrow:
        DateTime tomorrow = now.add(Duration(days: 1));
        homeFilteredTasks.assignAll(
          filteredTasksBySearch.where((task) {
            return task.date.year == tomorrow.year &&
                task.date.month == tomorrow.month &&
                task.date.day == tomorrow.day;
          }).toList(),
        );
        break;
      case FilterLabel.completed:
        homeFilteredTasks.assignAll(
          filteredTasksBySearch.where((task) => task.isComplete).toList(),
        );
        break;
      case FilterLabel.pending:
        homeFilteredTasks.assignAll(
          filteredTasksBySearch.where((task) => !task.isComplete).toList(),
        );
        break;
    }
  }
}
