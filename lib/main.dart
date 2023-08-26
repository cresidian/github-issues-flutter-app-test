import 'package:flutter/material.dart';
import 'package:github_issues_flutter_app_test/core/app/app.dart';

import 'core/app/app_config.dart';
import 'core/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setup(appConfig: AppConfig.dev());
  runApp(
    const GitHubIssuesFlutterTestApp(),
  );
}
