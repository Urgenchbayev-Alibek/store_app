import 'package:dio/dio.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: 'http://0.0.0.0:8888/api/v1'));
  }
  late final Dio dio;

}
