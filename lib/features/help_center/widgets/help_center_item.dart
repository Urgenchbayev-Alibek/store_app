import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/sizes.dart';
import '../../../core/utils/colors.dart';

class HelpCenterItem extends StatelessWidget {
  const HelpCenterItem({super.key, required this.icon, required this.text});

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25),
        width: 341.w,
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.45),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
                fontFamily: "General Sans",
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}