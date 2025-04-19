import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/account/pages/accout_view_logout_item.dart';
import 'package:store_app/features/common/store_app_bar.dart';
import '../../../core/routing/routes.dart';
import '../../../core/sizes.dart';
import '../../common/bottom_nav_bar.dart';
import '../widgets/acoount_view_item.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Account"),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(
                left: AppSizes.padding24, right: AppSizes.padding24),
            child: Divider(
                color: Colors.grey.withValues(alpha: 0.45), thickness: 1),
          ),
          AccountViewItem(
            width: 200.w,
            icon: "assets/icons/box.svg",
            text: "My Orders",
            onTap: () => context.push(Routes.myOrders),
          ),
          Divider(color: Colors.grey.withValues(alpha: 0.45), thickness: 8),
          AccountViewItem(
            width: 201.w,
            icon: "assets/icons/user.svg",
            text: "My Details",
            onTap: () => context.push(Routes.myDetails),
          ),
          Padding(
            padding: EdgeInsets.only(left: 63.0, right: AppSizes.padding25),
            child: Divider(
                color: Colors.grey.withValues(alpha: 0.45), thickness: 1),
          ),
          AccountViewItem(
            width: 178.w,
            icon: "assets/icons/home.svg",
            text: "Address Book",
            onTap: () => context.push(Routes.addressPage),
          ),
          Padding(
            padding: EdgeInsets.only(left: 63.0, right: AppSizes.padding25),
            child: Divider(
                color: Colors.grey.withValues(alpha: 0.45), thickness: 1),
          ),
          AccountViewItem(
            width: 144.w,
            icon: "assets/icons/card_white.svg",
            text: "Payment Methods",
            onTap: () => context.push(Routes.paymentMethod),
            // Routes.paymentMethods
          ),
          Padding(
            padding: EdgeInsets.only(left: 63.0, right: AppSizes.padding25),
            child: Divider(
                color: Colors.grey.withValues(alpha: 0.45), thickness: 1),
          ),
          AccountViewItem(
            width: 184.w,
            icon: "assets/icons/notification.svg",
            text: "Notifications",
            onTap: () => context.push(Routes.notification),
          ),
          Divider(color: Colors.grey.withValues(alpha: 0.45), thickness: 8),
          AccountViewItem(
            width: 237.w,
            icon: "assets/icons/question_mark.svg",
            text: "FAQs",
            onTap: () => context.push(Routes.faqs),
          ),
          Padding(
            padding: EdgeInsets.only(left: 63.0, right: AppSizes.padding25),
            child: Divider(
                color: Colors.grey.withValues(alpha: 0.45), thickness: 1),
          ),
          AccountViewItem(
            width: 189.w,
            icon: "assets/icons/headphones.svg",
            text: "Help Center",
            onTap: () => context.push(Routes.helpCenter),
          ),
          Divider(color: Colors.grey.withValues(alpha: 0.45), thickness: 8),
          AccoutViewLogoutItem(),
          const SizedBox(height: 24),
        ],
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
            default:
              break;
          }
        },
      ),
    );
  }
}
