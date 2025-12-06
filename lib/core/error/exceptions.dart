import 'package:plantapp/core/constants/app_constants.dart';

class ServerException implements Exception {
  ServerException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;
}

class NetworkException implements Exception {
  NetworkException({this.message = AppMessages.connectionError});

  final String message;
}

class CacheException implements Exception {
  CacheException({this.message = AppMessages.cacheError});

  final String message;
}
