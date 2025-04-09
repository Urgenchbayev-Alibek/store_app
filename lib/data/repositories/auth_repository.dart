import 'package:store_app/core/client.dart';
import 'package:store_app/core/secure_storage.dart';

import '../models/user_model.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  String? jwt;

  Future<void> login(String login, String password) async {
    final String token = await client.login(login: login, password: password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.saveToken(token: token);
    jwt = token;
  }

  Future<bool> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final result = await client.signUp(
      user: UserModel(
        password: password,
        email: email,
        fullName: fullName,
      ),
    );
    if (result["result"]) {
      SecureStorage.deleteToken();
      SecureStorage.saveToken(token: result["token"]);
      SecureStorage.deleteCredentials();
      SecureStorage.saveCredentials(login: email, password: password);
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials?['login'] == null || credentials?['password'] == null) {
      return false;
    } else {
      var jwt = await client.login(login: credentials!['login']!, password: credentials['password']!);
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(token: jwt);
      return true;
    }
  }
}
