import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repositories/auth_repository.dart';

part 'reset_event.dart';

part 'reset_state.dart';

class ResetPasswordBloc extends Bloc<ResetEvent, ResetState> {
  final AuthRepository _authRepository;

  ResetPasswordBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ResetState.initial()) {
    on<SendEmailEvent>(
          (event, emit) async {
        final result = await _authRepository.resetPassword(event.email);
        if (result) {
          emit(state.copyWith(status: ResetStatus.success));
        } else {
          emit(
            state.copyWith(
              status: ResetStatus.error,
              message: "password reset qilishda Emailda xato sodir boldi ",
            ),
          );
        }
      },
    );

    on<SendCodeEmail>((event, emit) async {
      emit(state.copyWith(status: ResetStatus.loading));
      final result = await _authRepository.postResetEmailCode(event.email, event.code);
      if (result) {
        emit(state.copyWith(status: ResetStatus.success));
      } else {
        emit(state.copyWith(
          status: ResetStatus.error,
          message: "Kodni tekshirishda xatolik yuz berdi.",
        ));
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      emit(state.copyWith(status: ResetStatus.loading));
      final result = await _authRepository.postResetEmailCodeReset(
          event.email, event.code, event.password);
      if (result) {
        emit(state.copyWith(status: ResetStatus.success));
      } else {
        emit(state.copyWith(
          status: ResetStatus.error,
          message: "Parolni tiklashda xatolik yuz berdi.",
        ));
      }
    });


  }
}