import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/constants/theme_constants.dart';
import 'package:todo_app/utils/add_task_model_sheet.dart';
import 'package:todo_app/utils/prefs_methods.dart';

class IndexPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const IndexPage({super.key, required this.navigationShell});

  void onBottomNavTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      appBar: AppBar(
        title: Text('Home', style: TextstyleConstants.homePlaceHolderTitle),
        leading: Icon(Icons.sort_outlined),
        centerTitle: true,
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        actions: [
          GestureDetector(
            onTap: () async {
              await SharedPrefsMethods.removeIsLogin();
              context.goNamed(AppRouterConstants.login);
            },
            child: CircleAvatar(radius: 20, backgroundColor: Colors.white),
          ),
        ],
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomNavTap,
        currentIndex: navigationShell.currentIndex,
        backgroundColor: ColorConstants.appBarBgColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: ColorConstants.grey1,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: SizedBox(), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
