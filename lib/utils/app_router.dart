import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/pages/add_category_page.dart';
import 'package:todo_app/pages/calendar_page.dart';
import 'package:todo_app/pages/focus_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/index_page.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:todo_app/pages/onboarding_page.dart';
import 'package:todo_app/pages/profile_page.dart';
import 'package:todo_app/pages/settings_page.dart';
import 'package:todo_app/pages/splash_page.dart';
import 'package:todo_app/pages/start_page.dart';
import 'package:todo_app/pages/task_page.dart';

GoRouter appRouter({required String initialLocation}) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorHomeKey = GlobalKey<NavigatorState>();
  final shellNavigatorCalendarKey = GlobalKey<NavigatorState>();
  final shellNavigatorFocusKey = GlobalKey<NavigatorState>();
  final shellNavigatorProfileKey = GlobalKey<NavigatorState>();
  return GoRouter(
    initialLocation: initialLocation,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: AppRouterConstants.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboard',
        name: AppRouterConstants.onboard,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/start',
        name: AppRouterConstants.start,
        builder: (context, state) => const StartPage(),
        routes: [],
      ),
      GoRoute(
        path: '/login',
        name: AppRouterConstants.login,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/task/:taskId',
        name: AppRouterConstants.task,
        builder: (context, state) =>
            TaskPage(taskId: state.pathParameters['taskId']!),
      ),

      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/add-category',
        name: AppRouterConstants.addCategory,
        builder: (context, state) => const AddCategoryPage(),
      ),

      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/settings',
        name: AppRouterConstants.settings,
        builder: (context, state) => const SettingsPage(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            IndexPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                name: AppRouterConstants.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCalendarKey,
            routes: [
              GoRoute(
                path: '/calendar',
                name: AppRouterConstants.calendar,
                builder: (context, state) => const CalendarPage(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: shellNavigatorFocusKey,
            routes: [
              GoRoute(
                path: '/focus',
                name: AppRouterConstants.focus,
                builder: (context, state) => const FocusPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRouterConstants.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
