import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  static const String _baseUrl = 'http://127.0.0.1:15001';
  //'https://670c66217e5a228ec1d0361f.mockapi.io/';

  //'https://bakawan-reward-system.fortress-asya.com';

  static const String _authToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZG1pbl9pZCI6MSwiZXhwIjoxNzU3MTE5NzU3LCJ1c2VybmFtZSI6ImFkbWluMDAxMSJ9.r6Tb4q_sWuad3UICS8gk551o0TDO08FLPesuubGOEqo';
  DioClient({String baseUrl = _baseUrl, String? token})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,
          headers: {'Authorization': token ?? _authToken},
        ),
      ) {
    // Optional: Add interceptors
    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await _dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  Future<Response> delete(String path, {dynamic data}) async {
    return await _dio.delete(path, data: data);
  }

  Dio get instance => _dio; // if you want to expose Dio directly
}
