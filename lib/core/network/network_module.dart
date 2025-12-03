import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/network/api_service.dart'; // Import eklendi

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppUrls.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }

  @lazySingleton
  ApiService getApiService(Dio dio) => ApiService(dio);
}
