class ServerException implements Exception {
  ServerException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;
}

class NetworkException implements Exception {
  NetworkException({this.message = 'İnternet bağlantınızı kontrol edin.'});

  final String message;
}

class CacheException implements Exception {
  CacheException({this.message = 'Önbellek hatası oluştu.'});

  final String message;
}
