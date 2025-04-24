import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/auth_repository.dart';
import 'my_details_event.dart';
import 'my_details_state.dart';

class MyDetailsBloc extends Bloc<MyDetailsEvent, MyDetailsState> {
  final AuthRepository _repo;
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  MyDetailsBloc({required AuthRepository repo})
      : _repo = repo,
        super(
          MyDetailsState(status: MyDetailsStatus.loading),
        ) {
    on<MyDetailsLoad>(_load);
  }

  Future<void> _load(MyDetailsLoad event, Emitter<MyDetailsState> emit) async {
    final info = await _repo.updateUser(
      gender: genderController.text.trim(),
      fullName: fullNameController.text.trim(),
      birthdate: birthController.text.trim(),
      phoneNumber: numberController.text.trim(),
      email: emailController.text.trim(),
    );

    if (info) {
      print(emailController.text);
      print(genderController.text);
      print(fullNameController.text);
      print(numberController.text);
      print(birthController.text);
      emit(state.copyWith(status: MyDetailsStatus.submitted));
    } else {
      emit(state.copyWith(status: MyDetailsStatus.error));
    }
  }
}
