import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: "http://10.5.33.173",
            receiveTimeout: 30000,
            sendTimeout: 30000,
          ),
        );

  Future<Response> getRequest(String path) async {
    return dio.get(path);
  }
}
