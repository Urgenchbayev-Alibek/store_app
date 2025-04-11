import 'package:flutter/material.dart';
import 'package:store_app/features/common/store_app_bar.dart';

import '../widgets/category_tabs.dart';
import '../widgets/navigation_bar.dart';
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
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
