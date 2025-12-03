import 'package:dio/dio.dart';
import 'package:plantapp/core/constants/app_constants.dart'; // Import
import 'package:plantapp/core/error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        throw NetworkException(message: AppMessages.timeoutError);

      case DioExceptionType.badResponse:
        throw ServerException(
          message: err.response?.statusMessage ?? AppMessages.serverError,
          statusCode: err.response?.statusCode,
        );

      case DioExceptionType.cancel:
        throw NetworkException(message: AppMessages.requestCancelled);

      case DioExceptionType.badCertificate:
        throw NetworkException(message: AppMessages.invalidCertificateError);

      default:
        throw ServerException(message: '${AppMessages.unknownNetworkError}: ${err.message}');
    }
  }
}
