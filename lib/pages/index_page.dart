import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/utils/add_task_model_sheet.dart';
import 'package:todo_app/widgets/fab_bottom_nav_bar.dart';

class IndexPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  IndexPage({super.key, required this.navigationShell});

  void onBottomNavTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  final appBarTitles = ['Home', 'Calendar', 'Focus', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      appBar: AppBar(
        title: Text(
          appBarTitles[navigationShell.currentIndex],
          style: TextstyleConstants.homePlaceHolderTitle,
        ),
        leading: navigationShell.currentIndex == 0
            ? Icon(Icons.sort_outlined)
            : SizedBox(),
        centerTitle: true,
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        actions: navigationShell.currentIndex == 0
            ? [
                GestureDetector(
                  onTap: () => context.goNamed(AppRouterConstants.profile),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                  ),
                ),
              ]
            : [],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: ColorConstants.purple,
        foregroundColor: Colors.white,
        child: Icon(Icons.add_rounded, size: 30),
        onPressed: () async {
          await showAddTaskModalSheet(context);
        },
      ),
      bottomNavigationBar: FABBottomNavBar(
        items: [
          FABBottomNavBarItem(icon: Icons.home_filled, label: 'Home'),
          FABBottomNavBarItem(icon: Icons.calendar_month, label: 'Calendar'),
          FABBottomNavBarItem(icon: Icons.access_time_outlined, label: 'Focus'),
          FABBottomNavBarItem(icon: Icons.person_outline, label: 'Profile'),
        ],
        onTabSelected: onBottomNavTap,
      ),
    );
  }
}
