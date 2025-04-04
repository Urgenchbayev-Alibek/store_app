import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repositories/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading()); // 🔹 Holat: Yuklanmoqda

    try {
      await authRepository.login(event.login, event.password);
      emit(LoginSuccess()); // 🔹 Holat: Muvaffaqiyatli
    } catch (e) {
      emit(LoginFailure(error: e.toString())); // 🔹 Holat: Xato
    }
  }
}
