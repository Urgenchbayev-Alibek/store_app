class UserModel {
  final String login;
  final String password;

  UserModel({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "login": login,
      "password": password,
    };
  }


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json["login"],
      password: json["password"],
    );
  }
}
