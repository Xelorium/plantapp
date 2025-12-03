import 'package:dio/dio.dart';
import 'package:plantapp/core/error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        throw NetworkException(message: 'Bağlantı zaman aşımına uğradı veya internet yok.');

      case DioExceptionType.badResponse:
        throw ServerException(
          message: err.response?.statusMessage ?? 'Sunucu hatası oluştu.',
          statusCode: err.response?.statusCode,
        );

      case DioExceptionType.cancel:
        throw NetworkException(message: 'İstek iptal edildi.');

      case DioExceptionType.unknown:
        throw NetworkException(message: 'Bilinmeyen bir ağ hatası oluştu.');

      case DioExceptionType.badCertificate:
        throw NetworkException(message: 'Geçersiz sertifika hatası oluştu.');
    }
  }
}
