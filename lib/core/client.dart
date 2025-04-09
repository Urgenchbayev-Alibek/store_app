import 'package:dio/dio.dart';

import 'exceptions/auth_exception.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: 'http://0.0.0.0:8888/api/v1'));
  }
  late final Dio dio;

  Future<String> login({required String login, required String password}) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!.toString();
    } else {
      throw AuthException(message: "Login qilib bo'madi, xullasi nimadur noto'g'ri ketgan.");
    }
  }

}
