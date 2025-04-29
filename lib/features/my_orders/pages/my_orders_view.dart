import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../common/bottom_nav_bar.dart';
import '../../common/store_app_bar.dart';
import '../widgets/my_orders_app_bar_bottom.dart';
import 'completed_order_view.dart';
import 'ongoing_order_view.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: StoreAppBar(
          title: "My Orders",
          bottom:  MyOrdersAppBarBottom(),
        ),
        body: TabBarView(
          children: [
            OngoingOrders(),
            CompletedOrders(),
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
            }
          },
        ),
      ),
    );
  }
}






