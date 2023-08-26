import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:github_issues_flutter_app_test/core/app/cubit/app_cubit.dart';
import 'package:github_issues_flutter_app_test/features/github_issues/presentation/cubit/github_issues_cubit.dart';

import '../di/injector.dart';
import '../resources/resources.dart';
import 'app_router.dart';

class GitHubIssuesFlutterTestApp extends StatefulWidget {
  const GitHubIssuesFlutterTestApp({super.key});

  static BuildContext? get appContext =>
      AppRouter.router.routerDelegate.navigatorKey.currentContext;

  @override
  State<StatefulWidget> createState() => _GitHubIssuesFlutterTestAppState();
}

class _GitHubIssuesFlutterTestAppState
    extends State<GitHubIssuesFlutterTestApp> {
  Future<void> setSystemPreferences() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.textColorWhite,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.cardBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    setSystemPreferences();
    return MultiBlocProvider(
      providers: appProviders,
      child: Builder(
        builder: (context) {
          final currentTheme = context.watch<ThemeCubit>().state;
          return MaterialApp.router(
            title: Strings.appName,
            theme: currentTheme,
            debugShowCheckedModeBanner: false,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routerDelegate: AppRouter.router.routerDelegate,
          );
        },
      ),
    );
  }

  get appProviders => [
        BlocProvider<ThemeCubit>(lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<GitHubIssuesCubit>(
            lazy: true, create: (_) => Injector.resolve()),
      ];
}
