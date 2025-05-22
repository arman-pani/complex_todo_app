import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/calendar_toggle_button.dart';
import 'package:todo_app/widgets/day_wise_timeline.dart';
import 'package:todo_app/widgets/task_list_tile.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final TaskController taskController = Get.find<TaskController>();

  void onDateChanged(DateTime date) {
    taskController.filterTasksByDateAndCompletion(
      selectedDateTime: date,
      showCompleted: taskController.showCalendarCompleted.value,
    );
  }

  void onToggle(bool val) {
    taskController.filterTasksByDateAndCompletion(
      selectedDateTime: taskController.selectedCalendarDateTime.value,
      showCompleted: val,
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = taskController.calendarFilteredTasks;

    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            DayWiseTimeline(
              selectedDateTime: taskController.selectedCalendarDateTime.value,
              onDateChanged: (date) => onDateChanged(date),
            ),

            CalendarToggleButton(
              showCompleted: taskController.showCalendarCompleted.value,
              onToggle: (val) => onToggle(val),
            ),

            filteredTasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 50),
                      Icon(Icons.task_alt_rounded, size: 60),
                      Text(
                        'No Tasks Found',
                        style: TextstyleConstants.homePlaceHolderTitle,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      itemCount: filteredTasks.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return TaskListTile(taskId: filteredTasks[index].id);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
