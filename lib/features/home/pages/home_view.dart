import 'package:flutter/material.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_body.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/search_and_wallet_bar.dart';
import '../widgets/category_tabs.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiscoverAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchAndWalletBar(),
            SizedBox(height:28),
            CategoryTabs(
              selectedIndex: selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),
            SizedBox(height: 16),
            DiscoverItems(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
