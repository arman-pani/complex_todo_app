import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/calendar_toggle_button.dart';
import 'package:todo_app/widgets/day_wise_timeline.dart';
import 'package:todo_app/widgets/task_list_tile.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDateTime = DateTime.now();
  bool showCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        DayWiseTimeline(
          selectedDateTime: selectedDateTime,
          onDateChanged: (date) {
            setState(() {
              selectedDateTime = date;
            });
          },
        ),

        CalendarToggleButton(
          showCompleted: showCompleted,
          onToggle: (val) {
            setState(() {
              showCompleted = val;
            });
          },
        ),

        ValueListenableBuilder(
          valueListenable: Hive.box<TaskModel>('tasks').listenable(),
          builder: (context, Box<TaskModel> box, child) {
            final tasks = box.values.where((task) {
              final isSameDate =
                  task.date.year == selectedDateTime.year &&
                  task.date.month == selectedDateTime.month &&
                  task.date.day == selectedDateTime.day;

              final isCompletedMatch = showCompleted
                  ? task.isComplete
                  : !task.isComplete;

              return isSameDate && isCompletedMatch;
            }).toList();

            return tasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 50),
                      Icon(
                        Icons.task_alt_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                      Text(
                        'No Tasks Found',
                        style: TextstyleConstants.homePlaceHolderTitle,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.separated(
                      itemCount: tasks.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return TaskListTile(task: tasks[index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
