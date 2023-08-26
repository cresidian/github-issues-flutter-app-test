import 'package:dio/dio.dart';
import 'package:github_issues_flutter_app_test/core/app/app_config.dart';
import 'package:github_issues_flutter_app_test/core/network/http_client.dart';
import 'package:github_issues_flutter_app_test/core/network/rest_api_client.dart';
import 'package:github_issues_flutter_app_test/core/network/service_config.dart';
import 'package:github_issues_flutter_app_test/core/resources/constants.dart';
import 'package:kiwi/kiwi.dart';

abstract class NetworkModule {
  static late KiwiContainer _container;

  static void setup(
      {required KiwiContainer container,
      required AppConfig appConfig,
      required bool mockEnvironment}) {
    _container = container;
    _setupServiceConfig(appConfig, mockEnvironment);
    _setupDioClient();
    _setupRestClient();
  }

  static void _setupServiceConfig(AppConfig appConfig, bool mockEnvironment) {
    _container.registerSingleton<ServiceConfig>(
      (_) => ServiceConfig(
          BaseOptions(
            baseUrl: appConfig.baseUrl,
            connectTimeout: Constants.connectTimeout,
            receiveTimeout: Constants.receiveTimeout,
          ),
          mockEnvironment: mockEnvironment),
    );
  }

  static void _setupDioClient() {
    _container.registerSingleton<DioHttpClient>(
      (_) => DioHttpClient(
        _container.resolve(),
      ),
    );
  }

  static void _setupRestClient() {
    _container.registerSingleton<RestAPIClient>(
      (_) => RestAPIClient(_container.resolve<DioHttpClient>().client),
    );
  }
}
