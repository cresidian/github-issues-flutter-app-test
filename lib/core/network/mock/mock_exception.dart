import 'package:dio/dio.dart';
import 'package:github_issues_flutter_app_test/core/resources/strings.dart';

class MockServerException extends DioException {
  MockServerException({required super.requestOptions});

  @override
  String? get message => Strings.mockServerError;

  @override
  String toString() {
    return Strings.mockServerError;
  }
}
