import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiClient {
  @lazySingleton
  Dio get apiClient => Dio(
        BaseOptions(
          baseUrl: 'http://10.0.2.2:5000/api/v1/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
}
