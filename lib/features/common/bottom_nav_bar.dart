import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/my_cart/pages/my_cart_view.dart';
import 'package:store_app/features/saved_items/pages/saved_item_view.dart';
import '../home/pages/home_view.dart';
import '../profile/pages/profile_view.dart';

class StoreBottomNavBar extends StatefulWidget {
  const StoreBottomNavBar({super.key});

  @override
  State<StoreBottomNavBar> createState() => _StoreBottomNavBarState();
}

class _StoreBottomNavBarState extends State<StoreBottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomeView(),
    SearchViewV2(),
    SavedItemView(),
    MyCartView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/heart.svg",
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              color: _selectedIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
