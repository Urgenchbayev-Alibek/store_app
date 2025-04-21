import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/sizes.dart';

import '../../../core/utils/colors.dart';
import '../../common/store_text_item.dart';

class AccountViewItem extends StatelessWidget {
  const AccountViewItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.width
  });

  final String icon, text;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25),
        width: double.infinity,
        height: 58.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(icon, colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),),
            SizedBox(width: 8.w),
            StoreTextItem(
              text: text,
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(width:width),
            SvgPicture.asset("assets/icons/next.svg"),
          ],
        ),
      ),
    );
  }
}
