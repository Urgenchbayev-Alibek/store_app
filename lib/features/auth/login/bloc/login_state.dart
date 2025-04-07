import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

// 🔹 Boshlang‘ich holat
class LoginInitial extends LoginState {}

// 🔹 Login yuklanmoqda
class LoginLoading extends LoginState {}

// 🔹 Login muvaffaqiyatli
class LoginSuccess extends LoginState {}

// 🔹 Login xatolik bilan tugadi
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
