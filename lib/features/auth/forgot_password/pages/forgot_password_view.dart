import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../../../core/utils/colors.dart';
import '../../../common/store_text_button.dart';
import '../../../common/store_text_form_field.dart';
import '../../sign_up/widgets/auth_page_title_and_subtitle.dart';
import '../../sign_up/widgets/store_app_bar_with_back_button.dart';
import '../bloc/reset_bloc.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();

  bool? emailValid;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarWithBackButton(),
      body: BlocListener<ResetPasswordBloc, ResetState>(
        listener: (context, state) {
          if (state.status == ResetStatus.success) {
            context.go(Routes.enterOtp, extra: emailController.text.trim());
          } else if (state.status == ResetStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Noma’lum xatolik')),
            );
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 14.h, 24.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthPageTitleAndSubtitle(
                  title: "Forgot password",
                  subtitle: "Enter your email for the verification process. We will send 4 digits code to your email.",
                ),
                SizedBox(height: 24.h),
                StoreTextFormField(
                  controller: emailController,
                  isValid: emailValid,
                  autoValidateMode: AutovalidateMode.disabled,
                  label: "Email",
                  hintText: "Enter your email address",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      emailValid = false;
                      return "This field is required.";
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      emailValid = false;
                      return "Enter a valid email address.";
                    }
                    emailValid = true;
                    return null;
                  },
                ),
                const Spacer(),
                BlocBuilder<ResetPasswordBloc, ResetState>(
                  builder: (context, state) {
                    return StoreTextButton(
                      text: state.status == ResetStatus.loading ? "Sending..." : "Send Code",
                      width: double.infinity,
                      height: 54.h,
                      backgroundColor: AppColors.primary,
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          context.read<ResetPasswordBloc>().add(
                                SendEmailEvent(
                                  email: emailController.text.trim(),
                                ),
                              );
                          setState(() {});
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
