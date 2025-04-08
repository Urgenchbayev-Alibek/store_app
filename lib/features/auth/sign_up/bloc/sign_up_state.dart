import 'package:equatable/equatable.dart';

import '../../../../data/models/user_model.dart';

 enum SignUpStatus { idle, loading, success, error }
class SignUpState extends Equatable {
  final UserModel user;
  final SignUpStatus status;

  const SignUpState({
    required this.user,
    required this.status,
  });

  factory SignUpState.initial() {
    return SignUpState(
      user: UserModel(fullName: '', email: '', password: ''),
      status: SignUpStatus.idle,
    );
  }

  SignUpState copyWith({
    UserModel? user,
    SignUpStatus? status,
  }) {
    return SignUpState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [user, status];
}
