import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/string_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/controllers/auth_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/utils/dialogs/profile_edit_dialogs.dart';
import 'package:todo_app/widgets/listtile_textbutton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Column(
          spacing: 20,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://picsum.photos/id/237/200/300',
              ),
            ),
            GetBuilder<AuthController>(
              builder: (controller) {
                return Text(
                  controller.user.username,
                  style: TextstyleConstants.homePlaceHolderTitle,
                );
              },
            ),
            Obx(() {
              final TaskController controller = Get.find<TaskController>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  taskInfoContainer('${controller.pendingTaskCount} Task left'),
                  SizedBox(width: 15),
                  taskInfoContainer(
                    '${controller.completedTaskCount} Task done',
                  ),
                ],
              );
            }),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Settings', style: TextstyleConstants.mediumText),
                ListTileTextButton(
                  icon: Icons.settings_rounded,
                  label: StringConstants.profileLabel1,
                  onTap: () => context.pushNamed(AppRouterConstants.settings),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Account', style: TextstyleConstants.mediumText),
                ListTileTextButton(
                  icon: Icons.person_outline_rounded,
                  label: StringConstants.profileLabel2,
                  onTap: () => showEditNameDialog(context),
                ),
                ListTileTextButton(
                  icon: Icons.key_rounded,
                  label: StringConstants.profileLabel3,
                  onTap: () => showEditPasswordDialog(context),
                ),
                ListTileTextButton(
                  icon: Icons.image_rounded,
                  label: StringConstants.profileLabel4,
                  onTap: () => showEditImageModalSheet(context),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Uptodo', style: TextstyleConstants.mediumText),
                ListTileTextButton(
                  icon: Icons.grid_view_outlined,
                  label: StringConstants.profileLabel5,
                  onTap: () {},
                ),
                ListTileTextButton(
                  icon: Icons.info_outline_rounded,
                  label: StringConstants.profileLabel6,
                  onTap: () {},
                ),
                ListTileTextButton(
                  icon: Icons.feedback_outlined,
                  label: StringConstants.profileLabel7,
                  onTap: () {},
                ),
                ListTileTextButton(
                  icon: Icons.thumb_up_off_alt,
                  label: StringConstants.profileLabel8,
                  onTap: () {},
                ),
                GetBuilder<AuthController>(
                  builder: (controller) {
                    return ListTileTextButton(
                      color: Colors.red,
                      icon: Icons.logout_outlined,
                      label: StringConstants.profileLabel9,
                      onTap: () => controller.logoutUser(context),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget taskInfoContainer(String text) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: ColorConstants.appBarBgColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(text, style: TextstyleConstants.buttonText),
      ),
    );
  }
}
