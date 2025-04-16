import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/bottom_nav_bar.dart';
import 'package:store_app/features/common/empty_view.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../common/store_app_bar.dart';
import '../widgets/my_cart_items.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  bool isNotEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: StoreAppBar(title: "My Cart"),
      backgroundColor: AppColors.onPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isNotEmpty == true
              ? MyCartItems()
              : EmptyView(
                  text: "Your Cart is empty!",
                  bio: "When you added product they'll\n "
                      "appear here.",
                  icon: Icons.shopping_cart,
                ),
        ],
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
