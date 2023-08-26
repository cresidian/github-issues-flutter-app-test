import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/resources/page_path.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/screens/github_issues_screen.dart';
import 'package:go_router/go_router.dart';

//Private Navigator Keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: PagePath.gitHubIssues,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: PagePath.gitHubIssues,
        builder: (context, state) => const GitHubIssuesScreen(),
      )
    ],
  );
}
