import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repositories/auth_repository.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';
import '../../../../data/models/user_model.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;

  SignUpBloc({required this.authRepo}) : super(SignUpState.initial()) {
    on<SubmitSignUpEvent>(_onSubmitSignUp);
  }

  Future<void> _onSubmitSignUp(
      SubmitSignUpEvent event,
      Emitter<SignUpState> emit,
      ) async {
    emit(state.copyWith(status: SignUpStatus.loading));

    final user = UserModel(
      fullName: event.fullName,
      email: event.email,
      password: event.password,
    );

    try {
      final success = await authRepo.signUp(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      );

      if (success) {
        emit(state.copyWith(user: user, status: SignUpStatus.success));
      } else {
        emit(state.copyWith(user: user, status: SignUpStatus.error));
      }
    } catch (_) {
      emit(state.copyWith(user: user, status: SignUpStatus.error));
    }
  }
}
