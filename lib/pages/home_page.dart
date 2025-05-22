import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/image_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/filter_drop_down_button.dart';
import 'package:todo_app/widgets/search_bar.dart';
import 'package:todo_app/widgets/task_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textInputController = TextEditingController();
  final TaskController taskController = Get.find<TaskController>();

  void onFilterButtonChanged(FilterLabel value) {
    taskController.filterTaskInHomePage(
      label: value,
      searchInput: textInputController.text.trim(),
    );
  }

  void onSearchBarChanged(String value) {
    taskController.filterTaskInHomePage(
      label: taskController.currentFilterLabel.value,
      searchInput: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = taskController.homeFilteredTasks;
    debugPrint(tasks.toList().toString());
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              CustomSearchBar(
                textInputController: textInputController,
                onChanged: (value) => onSearchBarChanged(value),
              ),
              FilterDropDownButton(
                initialLabel: taskController.currentFilterLabel.value,
                onChanged: (value) => onFilterButtonChanged(value),
              ),

              tasks.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            ImageConstants.homePlaceholder,
                            height: 250,
                            width: 250,
                          ),
                          Text(
                            StringConstants.homePlaceHolderTitle,
                            style: TextstyleConstants.homePlaceHolderTitle,
                          ),
                          Text(
                            StringConstants.homePlaceHolderSubTitle,
                            style: TextstyleConstants.onboardingSubTitle,
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks.toList()[index];
                        debugPrint("Taskid: ${task.id}");
                        return TaskListTile(taskId: task.id);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
