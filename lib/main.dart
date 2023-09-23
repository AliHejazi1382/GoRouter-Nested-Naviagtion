
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stateful_stevdza/details/information.dart';
import 'package:stateful_stevdza/details/overview.dart';
import 'package:stateful_stevdza/home/home.dart';
import 'package:stateful_stevdza/home/profile.dart';
import 'package:stateful_stevdza/home/settings.dart';
import 'package:stateful_stevdza/login/forgot.dart';
import 'package:stateful_stevdza/login/login.dart';
import 'package:stateful_stevdza/login/sign_up.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey();
final GlobalKey<NavigatorState> _authKey = GlobalKey();
final GlobalKey<NavigatorState> _homeKey = GlobalKey();
final GlobalKey<NavigatorState> _settingsKey = GlobalKey();
final GlobalKey<NavigatorState> _profileKey = GlobalKey();
final GlobalKey<NavigatorState> _detailKey = GlobalKey();


final _routes = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: '/login',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
        AuthScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _authKey,
          routes: [
            GoRoute(
              path: '/login',
              builder: (context, state) =>
                  const LoginScreen(),
              routes: [
                GoRoute(
                  path: 'signup',
                  builder: (context, state) =>
                      const SignUpScreen()
                ),
                GoRoute(
                  path: 'forgot',
                  builder: (context, state) =>
                      const ForgotScreen()
                ),
              ]
            )
          ]
        )
      ]
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
         HomeScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) =>
                  const HomeScreen()
            )
          ]
        ),
        StatefulShellBranch(
          navigatorKey: _settingsKey,
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) =>
                  const SettingsScreen()
            )
          ]
        ),
        StatefulShellBranch(
          navigatorKey: _profileKey,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) =>
                  const ProfileScreen()
            )
          ]
        ),
      ]
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
        DetailScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _detailKey,
          routes: [
            GoRoute(
              path: '/detail',
              builder: (context, state) =>
                  const InformationScreen(),
              routes: [
                GoRoute(
                  path: 'overview',
                  builder: (context, state) =>
                      const OverviewScreen()
                )
              ]
            )
          ]
        )
      ]
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _routes,
    );
  }
}
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _handleCurrentIndex(context),
          onTap: (index) => _onItemTap(index, context),
        ),
    );
  }

  int _handleCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/settings')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }

    return 0;
  }

  void _onItemTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/settings');
        break;
      case 2:
        GoRouter.of(context).go('/profile');
        break;
    }
  }
}

class DetailScaffold extends StatelessWidget {
  const DetailScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}