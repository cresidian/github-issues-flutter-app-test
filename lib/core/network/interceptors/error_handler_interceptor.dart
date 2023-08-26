import 'package:dio/dio.dart';
import 'package:github_issues_flutter_app_test/core/resources/strings.dart';

class ErrorHandlerInterceptor extends Interceptor {
  final int notAuthorizedCode = 420;
  final int serverErrorCode = 500;
  final errorTag = 'Error Intercepted: ';

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.error) {
      case DioExceptionType.connectionTimeout:
        throw _TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.sendTimeout:
        throw _TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.receiveTimeout:
        throw _TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.badResponse:
        {
          if (err.response?.statusCode == notAuthorizedCode) {
            throw _UnauthorizedException(requestOptions: err.requestOptions);
          } else if (err.response != null &&
              err.response!.statusCode! >= serverErrorCode) {
            throw _CommonException(requestOptions: err.requestOptions);
          } else {
            throw _BackendException(
                requestOptions: err.requestOptions, response: err.response);
          }
        }
      case DioExceptionType.unknown:
        {
          throw _TimeoutException(requestOptions: err.requestOptions);
        }
    }
    return handler.next(err);
  }
}

class _TimeoutException extends DioException {
  _TimeoutException({required super.requestOptions});

  @override
  String toString() {
    return Strings.timeoutError;
  }
}

class _CommonException extends DioException {
  _CommonException({required super.requestOptions});

  @override
  String toString() {
    return Strings.commonError;
  }
}

class _UnauthorizedException extends DioException {
  _UnauthorizedException({required RequestOptions requestOptions})
      : super(requestOptions: requestOptions) {
    _forceLogout();
  }

  void _forceLogout() async {
    ///Implement force logout here.
  }

  @override
  String toString() {
    return Strings.unauthorizedError;
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException({required super.requestOptions}) {}

  @override
  String toString() {
    return Strings.emptyString;
  }
}

class _BackendException extends DioException {
  String _message = '';

  _BackendException({
    required RequestOptions requestOptions,
    required Response? response,
  }) : super(requestOptions: requestOptions) {
    final data = response?.data as Map<String, dynamic>;
    final errorData = data['message'];
    _message = errorData ?? Strings.commonError;
  }

  @override
  String get message => _message;

  @override
  String toString() => message;
}
