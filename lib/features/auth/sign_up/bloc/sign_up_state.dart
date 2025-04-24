import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/user_model.dart';

part 'sign_up_state.freezed.dart';

enum SignUpStatus { idle, loading, success, error }

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    required UserModel user,
    required SignUpStatus status,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
    user: UserModel(fullName: '', email: '', password: ''),
    status: SignUpStatus.idle,
  );
}
