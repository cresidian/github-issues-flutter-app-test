import 'package:github_issues_flutter_app_test/core/app/app_config.dart';
import 'package:github_issues_flutter_app_test/core/di/modules/app_module.dart';
import 'package:github_issues_flutter_app_test/core/di/modules/cubit_module.dart';
import 'package:github_issues_flutter_app_test/core/di/modules/network_module.dart';
import 'package:github_issues_flutter_app_test/core/di/modules/repository_module.dart';
import 'package:kiwi/kiwi.dart';

abstract class Injector {
  static final KiwiContainer _container = KiwiContainer();
  static final resolve = _container.resolve;

  static Future<void> setup(
      {required AppConfig appConfig, bool mockEnvironment = false}) async {
    await AppModule.setup(_container);
    NetworkModule.setup(
        container: _container,
        appConfig: appConfig,
        mockEnvironment: mockEnvironment);
    RepositoryModule.setup(_container);
    CubitModule.setup(_container);
  }

  static void clear() {
    _container.clear();
  }
}
