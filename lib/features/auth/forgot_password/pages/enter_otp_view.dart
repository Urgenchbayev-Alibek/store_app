import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../common/store_text_button.dart';
import '../../sign_up/widgets/auth_page_title_and_subtitle.dart';
import '../../sign_up/widgets/store_app_bar_with_back_button.dart';
import '../bloc/reset_bloc.dart';

class EnterOtpView extends StatefulWidget {
  const EnterOtpView({super.key, required this.emailAddress});

  final String emailAddress;

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  final formKey = GlobalKey<FormState>();
  final int numOfDigits = 4;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(numOfDigits, (_) => TextEditingController());
    focusNodes = List.generate(numOfDigits, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Color getBackgroundColor() {
    return controllers.any((controller) => controller.text.isEmpty)
        ? AppColors.primary200
        : AppColors.primary;
  }

  String getCode() {
    return controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBarWithBackButton(),
      body: BlocListener<ResetPasswordBloc, ResetState>(
        listener: (context, state) {
          if (state.status == ResetStatus.success) {
            context.go(Routes.resetPassword, extra: {
              'email': widget.emailAddress,
              'code': getCode(),
            });
          } else if (state.status == ResetStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Noma’lum xatolik yuz berdi.')),
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
                  title: "Enter 4 Digit Code",
                  subtitle:
                  "Enter the 4-digit code that you received on your email (${widget.emailAddress}).",
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    numOfDigits,
                        (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: TextFormField(
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 32.r,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if (value.isNotEmpty && index < numOfDigits - 1) {
                            focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            focusNodes[index - 1].requestFocus();
                          }
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints.tight(Size(64.w, 60.h)),
                          counter: const SizedBox.shrink(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Didn't receive the code? ",
                      style: TextStyle(color: AppColors.primary, fontSize: 14.r),
                      children: [
                        TextSpan(
                          text: "Resend code",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Bu yerga resend code event qo‘shish mumkin
                            },
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.r,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                BlocBuilder<ResetPasswordBloc, ResetState>(
                  builder: (context, state) {
                    return StoreTextButton(
                      text: state.status == ResetStatus.loading
                          ? "Verifying..."
                          : "Continue",
                      width: double.infinity,
                      height: 54.h,
                      backgroundColor: getBackgroundColor(),
                      callback: () {
                        if (controllers.any((c) => c.text.isEmpty)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please enter all 4 digits")),
                          );
                          return;
                        }

                        final code = getCode();
                        context.read<ResetPasswordBloc>().add(
                          SendCodeEmail(
                            email: widget.emailAddress,
                            code: code,
                          ),
                        );
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
