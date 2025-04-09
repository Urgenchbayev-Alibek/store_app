import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String login;
  final String password;

  LoginButtonPressed({required this.login, required this.password});

  @override
  List<Object?> get props => [login, password];
}
