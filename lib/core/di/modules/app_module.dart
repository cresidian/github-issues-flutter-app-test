import 'package:github_issues_flutter_app_test/core/app/cubit/theme_cubit.dart';
import 'package:github_issues_flutter_app_test/data/sources/local/preferences/app_preferences.dart';
import 'package:kiwi/kiwi.dart';

abstract class AppModule {
  static late KiwiContainer _container;

  static Future<void> setup(KiwiContainer container) async {
    _container = container;

    _setupAppPreferences();
    _registerThemeCubit();
  }

  static void _setupAppPreferences() {
    _container.registerSingleton((_) => AppPreferences());
  }

  static void _registerThemeCubit() {
    _container.registerSingleton((_) => ThemeCubit());
  }
}
