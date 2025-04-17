import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/sizes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/store_app_bar.dart';

import '../../../core/routing/routes.dart';
import '../../common/bottom_nav_bar.dart';
import '../widgets/acoount_view_item.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Account"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25),
        children: [
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          AccountViewItem(
            icon: "assets/icons/box.svg",
            text: "My Orders",
            onTap: () => context.push(Routes.myOrders),
          ),
          const SizedBox(height: 16),
          AccountViewItem(
            icon: "assets/icons/user.svg",
            text: "My Details",
            onTap: () => context.push(Routes.myDetails),
          ),
          AccountViewItem(
            icon: "assets/icons/home.svg",
            text: "Address Book",
            onTap: () => context.push(Routes.addressPage),
          ),
          AccountViewItem(
            icon: "assets/icons/card.svg",
            text: "Payment Methods",
            onTap: () => context.push(""),
              // Routes.paymentMethods
          ),
          AccountViewItem(
            icon: "assets/icons/notification.svg",
            text: "Notifications",
            onTap: () => context.push(Routes.notification),
          ),
          const SizedBox(height: 8),
          Container(height: 8.h, color: Colors.grey.withOpacity(0.2)),
          const SizedBox(height: 16),
          AccountViewItem(
            icon: "assets/icons/question_mark.svg",
            text: "FAQs",
            onTap: () => context.push(Routes.faqs),

          ),
          AccountViewItem(
            icon: "assets/icons/headphones.svg",
            text: "Help Center",
            onTap: () => context.push(Routes.helpCenter),
          ),
          const SizedBox(height: 8),
          Container(height: 8.h, color: Colors.grey.withOpacity(0.2)),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              // logout logic
            },
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/logout.svg", color: Colors.red),
                const SizedBox(width: 10),
                const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ),
          ),
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

