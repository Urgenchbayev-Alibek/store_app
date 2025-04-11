import 'package:dio/dio.dart';
import 'package:store_app/core/interceptor.dart';

import '../data/models/user_model.dart';
import 'exceptions/auth_exception.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: 'http://192.168.137.378888/api/v1'));
    dio.interceptors.add(AuthInterceptor());
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

  Future<Map<String, dynamic>> signUp({required UserModel user}) async {
    var response = await dio.post("/auth/register", data: user.toJson());
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
  Future<T> genericGetRequest<T>(String path, {Map<String, dynamic>? queryParams}) async {
    var response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(requestOptions: response.requestOptions, response: response);
    }
  }

  Future<bool> postResetEmail(String email) async {
    try{
      var response = await dio.post(
        "/auth/reset-password/email",
        data: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }catch(e){
      print(e.toString());
      throw Exception();
    }
  }

  Future<bool> postResetEmailCode(String email, String code) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/verify",
        data: {
          'email': email,
          'code': code,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("xato ketdi reset emailCode");
    }
  }

  Future<bool> postResetEmailCodeReset(
      String email,
      String code,
      String password,
      ) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/reset",
        data: {
          'email': email,
          'password': password,
          'code': code,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("xato ketdi reset emailCode");
    }
  }


}
