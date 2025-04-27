import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreIconButtonContainer extends StatelessWidget {
  const StoreIconButtonContainer({
    super.key,
    required this.image,
    this.containerColor = AppColors.onPrimary,
    this.containerWidth = 24,
    this.containerHeight = 24,
    this.iconWidth = 18.75,
    this.iconHeight = 15.75,
    this.iconColor = AppColors.onSecondary,
    required this.callback,
    this.borderRadius,
    this.boxShadow
  });

  final String image;
  final double iconWidth, iconHeight,containerWidth, containerHeight;
  final Color iconColor, containerColor;
  final VoidCallback callback;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth.w,
      height: containerHeight.h,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: callback,
        icon: SvgPicture.asset(
          image,
          width: iconWidth.w,
          height: iconHeight.h,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}