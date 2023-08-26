import 'package:dio/dio.dart';
import 'package:github_issues_flutter_app_test/data/sources/local/preferences/app_preferences.dart';

import '../../di/injector.dart';
import '../network_keys.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  final _appPreferences = Injector.resolve<AppPreferences>();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // bool isTokenRequired = options.headers.containsKey(NetworkKeys.requiresToken);
    // if (isTokenRequired) {
    //   isTokenRequired = options.headers[NetworkKeys.requiresToken] as bool;
    // }
    // if (isTokenRequired) {
    //   String token = _appPreferences.getUserAccessToken() ?? '';
    //   options.headers.remove(NetworkKeys.requiresToken);
    //   options.headers.addAll({NetworkKeys.authHeaderKey: token});
    // }
    // String? token = '';
    // options.headers.addAll({
    //   NetworkKeys.authHeaderKey:
    //       'Bearer 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'
    // });
    handler.next(options);
  }
}
