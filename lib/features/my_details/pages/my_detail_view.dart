import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/store_app_text_field_string.dart';

import '../../../core/routing/routes.dart';
import '../../common/bottom_nav_bar.dart';
import '../../common/store_app_bar.dart';
import '../../common/store_app_elevated_button.dart';
import '../bloc/my_details_bloc.dart';
import '../bloc/my_details_event.dart';
import '../bloc/my_details_state.dart';
import '../widgets/my_detail_dataBirth_item.dart';
import '../widgets/my_details_number_item.dart';

class MyDetailView extends StatelessWidget {
  MyDetailView({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<String?> genderNotifier = ValueNotifier<String?>(null);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StoreAppBar(title: "My Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 10.h,
        ),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoreAppTextFieldString(
                    controller: context.read<MyDetailsBloc>().fullNameContr,
                    validator: (value) => null,
                    text: 'Full Name',
                  ),
                  StoreAppTextFieldString(
                    controller: context.read<MyDetailsBloc>().emailContr,
                    validator: (value) => null,
                    text: 'Email Address',
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: genderNotifier,
                    builder: (context, value, _) {
                      return DropdownButtonFormField<String>(
                        value: value,
                        items: const [
                          DropdownMenuItem(
                            value: 'male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'female',
                            child: Text('Female'),
                          ),
                        ],
                        onChanged: (selected) {
                          genderNotifier.value = selected;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r), // Border radius
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r), // Fokustagi border radius
                            borderSide: BorderSide(color: AppColors.facebookColor, width: 1.5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: AppColors.error),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: AppColors.error, width: 1.5),
                          ),
                        ),
                      );
                    },
                  ),
                  MyDetailsDateBirth(title: "Data"),
                  MyDetailsNumberItem(controller: context.read<MyDetailsBloc>().numberContr),
                  SizedBox(height: 60),
                  BlocConsumer<MyDetailsBloc, MyDetailsState>(
                    builder: (context, state) => StoreAppElevatedButton(
                      text: "Submit",
                      callback: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final bloc = context.read<MyDetailsBloc>();
                          bloc.genderContr.text = genderNotifier.value ?? '';
                          bloc.add(MyDetailsLoad());
                        }
                      },
                      radius: 10,
                    ),
                    listener: (BuildContext context, MyDetailsState state) {
                      if (state.status == MyDetailsStatus.submitted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Success"),
                              content: Text("Your details have been updated successfully."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context.go(Routes.login);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (state.status == MyDetailsStatus.error) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Something went wrong. Please try again."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 4,
        onTap: (index) {
          switch (index) {
            case 0:
              context.push(Routes.home);
              break;
            case 1:
              context.push(Routes.search);
              break;
            case 2:
              context.push(Routes.saved);
              break;
            case 3:
              context.push(Routes.myCart);
              break;
            case 4:
              context.push(Routes.account);
              break;
          }
        },
      ),
    );
  }
}
