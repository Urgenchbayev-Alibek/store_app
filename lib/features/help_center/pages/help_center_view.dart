import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/sizes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StoreAppBar(title: "Help Center"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25),
          child: Column(
            children: [
              Divider(color: Colors.grey.withValues(alpha: 0.45)),
              SizedBox(height: 15),
              HelpCenterItem(icon: "assets/icons/headphones.svg", text: "Customer Service"),
              SizedBox(height: 15),
              HelpCenterItem(icon: "assets/icons/whatsapp.svg", text: "Whatsapp"),
              SizedBox(height: 15),
              HelpCenterItem(icon: "assets/icons/website.svg", text: "Website"),
              SizedBox(height: 15),
              HelpCenterItem(icon: "assets/icons/facebook.svg", text: "Facebook"),
              SizedBox(height: 15),
              HelpCenterItem(icon: "assets/icons/twitter.svg", text: "Twitter"),
              SizedBox(height: 15),
              HelpCenterItem(icon: "assets/icons/instagram.svg", text: "Instagram"),
            ],
          ),
        ));
  }
}

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
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
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
