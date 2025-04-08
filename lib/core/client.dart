import 'package:dio/dio.dart';

import '../data/models/user_model.dart';
import 'exceptions/auth_exception.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: 'http://192.168.9.109:8888/api/v1'));
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

  Future<Map<String, dynamic>> signUp({required UserModel model}) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    if (response.statusCode == 201) {
      String token = response.data["accessToken"];
      return {
        "result": true,
        "token": token,
      };
    } else {
      return {
        "result": true,
        "token": null,
      };
    }
  }

}
