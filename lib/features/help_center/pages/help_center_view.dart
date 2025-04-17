import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/sizes.dart';
import 'package:store_app/features/common/bottom_nav_bar.dart';
import 'package:store_app/features/common/store_app_bar.dart';

import '../../../core/routing/routes.dart';
import '../widgets/help_center_item.dart';

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
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
        selectedIndex: 3,
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
