import 'package:dio/dio.dart';

class Network {
  Dio dio = Dio();
  Network() {
    dio.options = BaseOptions(
        baseUrl: "https://restaurant-api.dicoding.dev/",
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        headers: {"Accept": "application/json"});
    dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true, error: true));
  }
}
