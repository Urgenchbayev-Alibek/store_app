sealed class SignUpEvent {}

class SubmitSignUpEvent extends SignUpEvent {
  final String fullName;
  final String email;
  final String password;

  SubmitSignUpEvent({
    required this.fullName,
    required this.email,
    required this.password,
  });
}
