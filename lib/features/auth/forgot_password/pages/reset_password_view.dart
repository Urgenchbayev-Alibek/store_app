import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../../../core/utils/colors.dart';
import '../../../common/store_password_form_field.dart';
import '../../../common/store_text_button.dart';
import '../../sign_up/widgets/auth_page_title_and_subtitle.dart';
import '../../sign_up/widgets/store_app_bar_with_back_button.dart';
import '../bloc/reset_bloc.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordControllerOne = TextEditingController();
  final passwordControllerTwo = TextEditingController();

  bool? passwordOneValid, passwordTwoValid;

  final formKey = GlobalKey<FormState>();

  Color getBackgroundColor() {
    if (passwordOneValid == null || passwordTwoValid == null) {
      return AppColors.primary200;
    }

    if (!passwordOneValid! || !passwordTwoValid!) {
      return AppColors.primary200;
    }

    return AppColors.primary;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Your password has been successfully reset."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                context.go(Routes.login); // Navigate to login
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarWithBackButton(),
      body: BlocListener<ResetPasswordBloc, ResetState>(
        listener: (context, state) {
          if (state.status == ResetStatus.success) {
            _showSuccessDialog(); // show dialog first
          } else if (state.status == ResetStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Something went wrong')),
            );
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 14, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthPageTitleAndSubtitle(
                  title: "Reset Password",
                  subtitle: "Set the new password for your account so you can login and access all the features.",
                ),
                SizedBox(height: 24),
                StorePasswordFormField(
                  controller: passwordControllerOne,
                  isValid: passwordOneValid,
                  label: "Password",
                  hintText: "Enter your password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      passwordOneValid = false;
                      setState(() {});
                      return "This field is required.";
                    }
                    if (value.length < 6) {
                      passwordOneValid = false;
                      setState(() {});
                      return "Password must be at least 6 characters.";
                    }
                    passwordOneValid = true;
                    setState(() {});
                    return null;
                  },
                ),
                SizedBox(height: 16),
                StorePasswordFormField(
                  controller: passwordControllerTwo,
                  isValid: passwordTwoValid,
                  label: "Confirm Password",
                  hintText: "Repeat your password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      passwordTwoValid = false;
                      setState(() {});
                      return "This field is required.";
                    }
                    if (value != passwordControllerOne.text) {
                      passwordTwoValid = false;
                      setState(() {});
                      return "Passwords do not match.";
                    }
                    passwordTwoValid = true;
                    setState(() {});
                    return null;
                  },
                ),
                const Spacer(),
                BlocBuilder<ResetPasswordBloc, ResetState>(
                  builder: (context, state) {
                    return StoreTextButton(
                      text: state.status == ResetStatus.loading ? "Resetting..." : "Continue",
                      width: double.infinity,
                      height: 54,
                      backgroundColor: getBackgroundColor(),
                      callback: () {
                        final isValid = formKey.currentState!.validate();
                        if (isValid) {
                          context.read<ResetPasswordBloc>().add(
                                ResetPasswordEvent(
                                  email: widget.email,
                                  code: widget.code,
                                  password: passwordControllerOne.text,
                                ),
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
