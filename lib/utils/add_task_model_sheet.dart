import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/task_add_controller.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/widgets/custom_text_field2.dart';

Future<void> showAddTaskModalSheet(BuildContext context) async {
  final controller = Get.find<TaskAddController>();
  controller.onInit();
  await modalSheet(context).whenComplete(() => controller.onClose());
}

Future<void> modalSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: ColorConstants.appBarBgColor,
    isScrollControlled: true,
    builder: (context) {
      return GetBuilder<TaskAddController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Task',
                        style: TextstyleConstants.homePlaceHolderTitle,
                      ),
                      Text(
                        '${formatDateTimetoString(controller.selectedDate)}, ${formatTimeOfDayToString(controller.selectedTime)}',
                        style: TextstyleConstants.onboardingSubTitle,
                      ),
                    ],
                  ),
                  CustomTextField2(
                    hintText: 'Task',
                    controller: controller.titleInputController,
                  ),
                  CustomTextField2(
                    hintText: 'Description',
                    controller: controller.descriptionInputController,
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () => controller.changeDateTime(context),
                        icon: Icon(Icons.timer_outlined),
                      ),
                      IconButton(
                        onPressed: () => controller.changeCategory(context),
                        icon: Row(
                          spacing: 3,
                          children: [
                            Icon(controller.getSelectedCategory.icon),
                            Text(
                              style: TextstyleConstants.underText,
                              controller.getSelectedCategory.name,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.changePriority(context),
                        icon: Row(
                          spacing: 3,
                          children: [
                            Icon(Icons.flag_outlined),
                            Text(
                              style: TextstyleConstants.underText,
                              controller.selectedPriority.toString(),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () => controller.saveTask(context),
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorConstants.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
