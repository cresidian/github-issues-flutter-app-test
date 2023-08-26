import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_issues_flutter_app_test/core/network/mock/mock_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_handler_interceptor.dart';
import 'interceptors/network_connection_interceptor.dart';

class ServiceConfig {
  ServiceConfig(this.baseOptions, {required this.mockEnvironment});

  final BaseOptions baseOptions;
  final bool mockEnvironment;

  Set<Interceptor> getInterceptors() {
    final interceptors = <Interceptor>{}..addAll(
        {
          AuthInterceptor(),
          NetworkConnectionInterceptor(),
          ErrorHandlerInterceptor(),
          if (mockEnvironment) MockInterceptor(),
          // CacheInterceptor(
          //     cacheOptions: CacheOptions(endpointsToCache: [
          //   Endpoints.home,
          // ])),
          if (kDebugMode)
            PrettyDioLogger(requestHeader: true, requestBody: true)
        },
      );

    return interceptors;
  }
}
