import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../../core/sizes.dart';

class AccoutViewLogoutItem extends StatelessWidget {
  const AccoutViewLogoutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 72.h,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/logout.svg"),
            SizedBox(width: 20.w),
            Text(
              "Logout",
              style: TextStyle(
                  color: AppColors.error,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "General Sans"),
            )
          ],
        ),
      ),
    );
  }
}
