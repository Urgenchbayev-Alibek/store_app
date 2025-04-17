import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/bottom_nav_bar.dart';
import 'package:store_app/features/common/store_app_bar.dart';
import '../../search/pages/search_view.dart';
import '../../../core/routing/routes.dart';
import '../widgets/category_tabs.dart';
import '../widgets/products_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "Discover",
        showLeading: false,
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for clothes...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
          CategoryTabs(),
          ProductGrid(),
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(
      selectedIndex: 0,
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
