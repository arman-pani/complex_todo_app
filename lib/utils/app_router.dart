import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/constants/app_router_constants.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/index_page.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:todo_app/pages/onboarding_page.dart';
import 'package:todo_app/pages/splash_page.dart';
import 'package:todo_app/pages/start_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final _shellNavigatorCalendarKey = GlobalKey<NavigatorState>();
final _shellNavigatorFocusKey = GlobalKey<NavigatorState>();
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
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

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          IndexPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              name: AppRouterConstants.home,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCalendarKey,
          routes: [
            GoRoute(
              path: '/calendar',
              name: AppRouterConstants.calendar,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFocusKey,
          routes: [
            GoRoute(
              path: '/focus',
              name: AppRouterConstants.focus,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/profile',
              name: AppRouterConstants.profile,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
