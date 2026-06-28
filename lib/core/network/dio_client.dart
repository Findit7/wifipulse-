import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../env/env_config.dart';
import '../utils/logger.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(DioClientRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: EnvConfig.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        AppLog().d('API Request: [${options.method}] ${options.uri}');
        // TODO: Inject Firebase Auth Token here from AuthController
        return handler.next(options);
      },
      onResponse: (response, handler) {
        AppLog().d('API Response: [${response.statusCode}] ${response.requestOptions.uri}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        AppLog().e('API Error: [${e.response?.statusCode}] ${e.requestOptions.uri}', e);
        return handler.next(e);
      },
    ),
  );

  return dio;
}
