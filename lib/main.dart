

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
              path: '/details',
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
      body: navigationShell,
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: _onTap,
          selectedIndex: navigationShell.currentIndex,
          destinations: const[
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
          ]
        )
    );
  }
}

class DetailScaffold extends StatelessWidget {
  const DetailScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
    );
  }
}