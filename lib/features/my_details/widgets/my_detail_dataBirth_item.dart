import 'package:birth_picker/birth_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../bloc/my_details_bloc.dart';

class MyDetailsDateBirth extends StatelessWidget {
  const MyDetailsDateBirth({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyDetailsBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.onSecondary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 3.h),
        BirthPicker(
          locale: "en",
          textStyle: TextStyle(
            color: AppColors.onSecondary,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
          iconColor: AppColors.onSecondary,
          minimumDate: DateTime(1900),
          maximumDate: DateTime.now(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.onSecondary, width: 1),
          ),
          onChanged: (dateTime) {
            if (dateTime != null) {
              bloc.birthController.text = dateTime.toIso8601String().split("T").first;
            }
          },
        ),
      ],
    );
  }
}
