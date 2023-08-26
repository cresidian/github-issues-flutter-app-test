import 'package:dio/dio.dart';
import 'package:github_issues_flutter_app_test/core/network/end_points.dart';
import 'package:github_issues_flutter_app_test/core/network/mock/mock_exception.dart';
import 'package:github_issues_flutter_app_test/core/network/mock/mock_responder.dart';

class MockInterceptor extends Interceptor {
  ///
  ///Initializing mock responder here 'mockEndpoints' provide Endpoints and path to Json stub file
  MockResponder mockResponder = MockResponder(
      responseDelay: const Duration(milliseconds: 100),
      mockEndpoints: {
        Endpoints.gitHubIssues: 'assets/jsonstubs/home_response.json'
      });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final endpoint = '/${options.uri.pathSegments.join("/")}';
    if (mockResponder.mockEndpoints.keys.contains(endpoint)) {
      final data = await mockResponder.getResponse(endpoint);
      if (data == null) {
        handler.reject(MockServerException(requestOptions: options));
        return;
      }
      final response = Response(data: data, requestOptions: options);
      handler.resolve(response);
    } else {
      ///If endpoint is not set to mock proceed with remote request
      handler.next(options);
    }
  }
}
